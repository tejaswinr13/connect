import org.springframework.kafka.annotation.RetryableTopic;
import org.springframework.kafka.config.RetryTopicConfiguration;
import org.springframework.kafka.config.RetryTopicConfigurationBuilder;
import org.springframework.kafka.listener.TopicPartitionOffset;

public class RetryableTopicConfig {

    public RetryTopicConfiguration configureRetryableTopic() {
        return RetryTopicConfigurationBuilder
                .newInstance()
                .fixedBackOff(1000L) // Delay of 1000 milliseconds
                .maxAttempts(3)
                .exclude(JsonParseException.class)
                .dltStrategy(DltStrategy.FAIL_ON_ERROR)
                .retryTopicSuffix("-retry")
                .dltTopicSuffix("-dlt")
                .topicSuffixingStrategy(TopicSuffixingStrategy.SUFFIX_WITH_INDEX_VALUE)
                .fixedDelayTopicStrategy(FixedDelayStrategy.MULTIPLE_TOPICS)
                .createTemplate();
    }

    // Example of usage
    @RetryableTopic(configBean = "retryTopicConfiguration")
    public void yourRetryableMethod(TopicPartitionOffset topicPartitionOffset) {
        // Method logic
    }
}
