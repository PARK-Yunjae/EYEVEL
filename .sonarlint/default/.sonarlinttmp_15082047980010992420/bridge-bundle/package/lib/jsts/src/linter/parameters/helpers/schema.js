"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getRuleSchema = void 0;
const helpers_1 = require("@sonar/shared/helpers");
/**
 * Extracts the schema of a rule
 * @param ruleModule the rule definition
 * @param ruleId the rule id
 * @returns the extracted rule schema, if any
 */
function getRuleSchema(ruleModule, ruleId) {
    var _a;
    if (!ruleModule) {
        (0, helpers_1.debug)(`ruleModule not found for rule ${ruleId}`);
        return undefined;
    }
    if (!((_a = ruleModule.meta) === null || _a === void 0 ? void 0 : _a.schema)) {
        return undefined;
    }
    const { schema } = ruleModule.meta;
    return Array.isArray(schema) ? schema : [schema];
}
exports.getRuleSchema = getRuleSchema;
//# sourceMappingURL=schema.js.map