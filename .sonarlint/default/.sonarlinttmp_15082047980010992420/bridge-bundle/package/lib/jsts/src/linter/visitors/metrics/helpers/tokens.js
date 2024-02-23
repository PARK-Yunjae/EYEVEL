"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.extractTokensAndComments = void 0;
/**
 * Extracts comments and tokens from an ESLint source code
 *
 * The returned extracted comments includes also those from
 * the template section of a Vue.js Single File Component.
 *
 * @param sourceCode the source code to extract from
 * @returns the extracted tokens and comments
 */
function extractTokensAndComments(sourceCode) {
    var _a, _b;
    const ast = sourceCode.ast;
    const tokens = [...((_a = ast.tokens) !== null && _a !== void 0 ? _a : [])];
    const comments = [...((_b = ast.comments) !== null && _b !== void 0 ? _b : [])];
    if (ast.templateBody) {
        const { templateBody } = ast;
        tokens.push(...templateBody.tokens);
        comments.push(...templateBody.comments);
    }
    return { tokens, comments };
}
exports.extractTokensAndComments = extractTokensAndComments;
//# sourceMappingURL=tokens.js.map