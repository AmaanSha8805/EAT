package com.eat.util;

/**
 * Utility class for securely accessing environment variables.
 * This ensures sensitive credentials like API keys are never hardcoded.
 */
public class EnvironmentUtil {

    /**
     * Gets an environment variable value.
     * 
     * @param key The environment variable name
     * @return The environment variable value, or null if not set
     */
    public static String getEnv(String key) {
        return System.getenv(key);
    }

    /**
     * Gets an environment variable value with a default fallback.
     * 
     * @param key The environment variable name
     * @param defaultValue The default value if the environment variable is not set
     * @return The environment variable value, or the default value if not set
     */
    public static String getEnv(String key, String defaultValue) {
        String value = System.getenv(key);
        return value != null ? value : defaultValue;
    }

    /**
     * Checks if an environment variable is set and non-empty.
     * 
     * @param key The environment variable name
     * @return true if the environment variable is set and non-empty
     */
    public static boolean isEnvSet(String key) {
        String value = System.getenv(key);
        return value != null && !value.trim().isEmpty();
    }
}
