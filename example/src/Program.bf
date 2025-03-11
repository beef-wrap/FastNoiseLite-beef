using System;
using System.Diagnostics;
using static FastNoiseLite.FastNoiseLite;
using static stb.stb_image_write;

namespace example;

static class Program
{
	const int width = 256;
	const int height = 256;
	const int CHANNEL_NUM = 3;

	static int Main(params String[] args)
	{
		fnl_state noise = fnlCreateState();
		noise.noise_type = .FNL_NOISE_CELLULAR;
		noise.seed = 1000;

		// Gather noise data
		uint8[width * height * 3] noiseData = .();

		int index = 0;

		for (let x < width)
		{
			for (let y < height)
			{
				uint8 val = (.)(fnlGetNoise2D(&noise, x, y) * 255.99);
				noiseData[index++] = val;
				noiseData[index++] = val;
				noiseData[index++] = val;
			}
		}

		stbi_write_png("test.png", width, height, CHANNEL_NUM, &noiseData, width * CHANNEL_NUM);

		return 0;
	}
}