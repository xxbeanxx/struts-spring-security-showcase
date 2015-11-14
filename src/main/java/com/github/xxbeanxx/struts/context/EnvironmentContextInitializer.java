package com.github.xxbeanxx.struts.context;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

/**
 * @author Greg Baker
 */
public class EnvironmentContextInitializer
		implements ApplicationContextInitializer<ConfigurableApplicationContext> {

	private static final Logger LOGGER = LoggerFactory.getLogger(EnvironmentContextInitializer.class);
	
	@Override
	public void initialize(ConfigurableApplicationContext applicationContext) {
		final ConfigurableEnvironment configurableEnvironment = applicationContext.getEnvironment();
		final MutablePropertySources mutablePropertySources = configurableEnvironment.getPropertySources();

		try {
			mutablePropertySources.addFirst(new ResourcePropertySource("classpath:environment.properties"));
		}
		catch (final IOException ioException) {
			LOGGER.error("Couldn't find environment.properties in application's classpath", ioException);
			throw new RuntimeException("Couldn't find environment.properties in application's classpath", ioException);
		}

		try {
			mutablePropertySources.addFirst(new ResourcePropertySource("classpath:environment-overrides.properties"));
		}
		catch (final IOException ioException) {
			LOGGER.warn("Couldn't find environment-overrides.properties in application's classpath. Will use production values.");
		}
	}

}
