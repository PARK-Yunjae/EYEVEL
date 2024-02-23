"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.pickResourceName = exports.serverlessParsingContext = exports.lambdaParsingContext = void 0;
exports.lambdaParsingContext = {
    predicate: isInlineAwsLambda,
    picker: pickResourceName.bind(null, 6),
};
exports.serverlessParsingContext = {
    predicate: isInlineAwsServerless,
    picker: pickResourceName.bind(null, 4),
};
/**
 * Checks if the given YAML AST node is an AWS Lambda function with the following structure:
 *
 * SomeLambdaFunction:
 *   Type: "AWS::Lambda::Function"
 *   Properties:
 *     Runtime: <nodejs-version>
 *     Code:
 *       ZipFile: <embedded-js-code>
 */
function isInlineAwsLambda(_key, pair, ancestors) {
    return (isZipFile(pair) &&
        hasCode(ancestors) &&
        hasNodeJsRuntime(ancestors) &&
        hasType(ancestors, 'AWS::Lambda::Function'));
    function isZipFile(pair) {
        return pair.key.value === 'ZipFile';
    }
    function hasCode(ancestors, level = 2) {
        var _a, _b;
        return ((_b = (_a = ancestors[ancestors.length - level]) === null || _a === void 0 ? void 0 : _a.key) === null || _b === void 0 ? void 0 : _b.value) === 'Code';
    }
}
/**
 * Checks if the given YAML AST node is an AWS Serverless function with the following structure:
 *
 * SomeServerlessFunction:
 *   Type: "AWS::Serverless::Function"
 *   Properties:
 *     Runtime: <nodejs-version>
 *     InlineCode: <embedded-js-code>
 */
function isInlineAwsServerless(_key, pair, ancestors) {
    return (isInlineCode(pair) &&
        hasNodeJsRuntime(ancestors, 1) &&
        hasType(ancestors, 'AWS::Serverless::Function', 3));
    /**
     * We need to check the pair directly instead of ancestors,
     * otherwise it will validate all siblings.
     */
    function isInlineCode(pair) {
        return pair.key.value === 'InlineCode';
    }
}
function hasNodeJsRuntime(ancestors, level = 3) {
    var _a, _b;
    return (_b = (_a = ancestors[ancestors.length - level]) === null || _a === void 0 ? void 0 : _a.items) === null || _b === void 0 ? void 0 : _b.some((item) => { var _a; return (item === null || item === void 0 ? void 0 : item.key.value) === 'Runtime' && ((_a = item === null || item === void 0 ? void 0 : item.value) === null || _a === void 0 ? void 0 : _a.value.startsWith('nodejs')); });
}
function hasType(ancestors, value, level = 5) {
    var _a, _b;
    return (_b = (_a = ancestors[ancestors.length - level]) === null || _a === void 0 ? void 0 : _a.items) === null || _b === void 0 ? void 0 : _b.some((item) => (item === null || item === void 0 ? void 0 : item.key.value) === 'Type' && (item === null || item === void 0 ? void 0 : item.value.value) === value);
}
/**
 * Picks the embeddedJS resource name for AWS lambdas and serverless functions
 */
function pickResourceName(level, _key, _pair, ancestors) {
    const ancestorsAtResourcesLevel = ancestors[ancestors.length - level];
    return {
        resourceName: ancestorsAtResourcesLevel.key.value,
    };
}
exports.pickResourceName = pickResourceName;
//# sourceMappingURL=parsingContexts.js.map