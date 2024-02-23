"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sanitize = void 0;
/**
 * Sanitizes a TypeScript ESLint rule
 *
 * TypeScript ESLint rules that relies on TypeScript's type system unconditionally assumes
 * that the type checker is always available. Linting a source code with such rules could
 * lead to a runtime error if that assumption turned out to be wrong for whatever reason.
 *
 * Aa TypeScript ESLint rule needs, therefore, to be sanitized in case its implementation
 * relies on type checking. The metadata of such a rule sets the `requiresTypeChecking`
 * property to `true`.
 *
 * The sanitization of a rule is nothing more than a decoration of its implementation. It
 * determines whether the rule uses type checking and checks whether type information is
 * available at runtime. If so, the execution of the rule proceeds; otherwise, it stops.
 *
 * @param rule a TypeScript ESLint rule to sanitize
 * @returns the sanitized rule
 */
function sanitize(rule) {
    return {
        ...(!!rule.meta && { meta: rule.meta }),
        create(context) {
            var _a;
            /**
             * Overrides the rule behaviour if it requires TypeScript's type checker
             * but type information is missing.
             */
            if (((_a = rule.meta) === null || _a === void 0 ? void 0 : _a.docs) &&
                rule.meta.docs.requiresTypeChecking === true &&
                context.parserServices.hasFullTypeInformation !== true) {
                return {};
            }
            return rule.create(context);
        },
    };
}
exports.sanitize = sanitize;
//# sourceMappingURL=sanitize.js.map