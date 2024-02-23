"use strict";
/*
 * SonarQube JavaScript Plugin
 * Copyright (C) 2011-2023 SonarSource SA
 * mailto:info AT sonarsource DOT com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
// https://sonarsource.github.io/rspec/#/rspec/S131/javascript
var _a, _b;
Object.defineProperty(exports, "__esModule", { value: true });
exports.rule = void 0;
const typescript_eslint_1 = require("../typescript-eslint");
const helpers_1 = require("../helpers");
/**
 * This rule raises issues on switch statements without a default branch if, and only if,
 * the discriminant of the switch statement is not of union type. This exception is due to
 * `switch-exhaustiveness-check` decorated below which checks the exhaustiveness of switch
 * statements on TypeScript unions and enums. Therefore, we avoid here raising multiple issues if the
 * discriminant of the switch statement denotes a union or enum, provided that type information is available.
 */
const switchWithoutDefaultRule = {
    meta: {
        messages: {
            switchDefault: `Add a "default" clause to this "switch" statement.`,
            addDefault: 'Add a "default" branch.',
        },
    },
    create(context) {
        const services = context.parserServices;
        const hasTypeInformation = (0, helpers_1.isRequiredParserServices)(services);
        return {
            SwitchStatement(node) {
                const { discriminant, cases } = node;
                if (hasTypeInformation && (0, helpers_1.isUnion)(discriminant, services)) {
                    return;
                }
                const defaultClause = cases.find(c => c.test === null);
                if (!defaultClause) {
                    const switchKeyword = getSwitchKeyword(node, context);
                    context.report({
                        messageId: 'switchDefault',
                        loc: switchKeyword.loc,
                        suggest: [
                            {
                                messageId: 'addDefault',
                                fix(fixer) {
                                    return fixSwitch(fixer, node, context.sourceCode);
                                },
                            },
                        ],
                    });
                }
            },
        };
    },
};
/**
 * The rule `switch-exhaustiveness-check` is a TypeScript ESLint rule that uses type information.
 * Therefore, we need to sanitize the rule in case TypeScript's type checker is missing when the
 * rule is executed to prevent runtime errors. Furthermore, we need to decorate the rule so that
 * it raises issues at the same location, that is, the `switch` keyword.
 */
const switchExhaustivenessRule = typescript_eslint_1.tsEslintRules['switch-exhaustiveness-check'];
const decoratedSwitchExhaustivenessRule = (0, helpers_1.interceptReport)(switchExhaustivenessRule, function (context, descriptor) {
    const switchNode = descriptor.node.parent;
    const switchKeyword = getSwitchKeyword(switchNode, context);
    context.report({ ...descriptor, loc: switchKeyword.loc });
});
function getSwitchKeyword(node, context) {
    return context.sourceCode.getFirstToken(node, token => token.type === 'Keyword' && token.value === 'switch');
}
function fixSwitch(fixer, node, sourceCode) {
    /** Either suggest a default branch after the last case while preserving contextual indentation */
    var _a, _b;
    const lastCase = node.cases.length > 0 ? node.cases[node.cases.length - 1] : null;
    const caseIndent = lastCase
        ? ' '.repeat((_a = lastCase.loc) === null || _a === void 0 ? void 0 : _a.start.column)
        : ' '.repeat((_b = node.loc) === null || _b === void 0 ? void 0 : _b.start.column);
    const code = "default: { throw new Error('Not implemented yet'); }";
    const fixString = `${caseIndent}${code}`;
    if (lastCase) {
        return fixer.insertTextAfter(lastCase, `\n${fixString}`);
    }
    /* Or suggest a default branch with the same indentation level as the switch starting line */
    const openingBrace = sourceCode.getTokenAfter(node.discriminant, token => token.type === 'Punctuator' && token.value === '{');
    const closingBrace = sourceCode.getTokenAfter(node.discriminant, token => token.type === 'Punctuator' && token.value === '}');
    return fixer.replaceTextRange([openingBrace.range[0], closingBrace.range[1]], ['{', fixString, `${caseIndent}}`].join('\n'));
}
exports.rule = {
    meta: {
        hasSuggestions: true,
        messages: {
            ...(_a = switchWithoutDefaultRule.meta) === null || _a === void 0 ? void 0 : _a.messages,
            ...(_b = decoratedSwitchExhaustivenessRule.meta) === null || _b === void 0 ? void 0 : _b.messages,
        },
    },
    create(context) {
        return (0, helpers_1.mergeRules)(switchWithoutDefaultRule.create(context), decoratedSwitchExhaustivenessRule.create(context));
    },
};
//# sourceMappingURL=rule.js.map