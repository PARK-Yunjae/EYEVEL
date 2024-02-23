import { EmbeddedAnalysisInput as YamlAnalysisInput, EmbeddedAnalysisOutput as YamlAnalysisOutput } from '@sonar/jsts/embedded';
export { YamlAnalysisInput, YamlAnalysisOutput };
export declare function analyzeYAML(input: YamlAnalysisInput): Promise<YamlAnalysisOutput>;
