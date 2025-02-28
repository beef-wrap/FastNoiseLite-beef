using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using static FastNoiseLite_Beef.FastNoiseLite;

namespace example;

static class Program
{
	const int w = 128;
	const int h = 128;

	static int Main(params String[] args)
	{
		fnl_state noise = fnlCreateState();
		noise.noise_type = .FNL_NOISE_OPENSIMPLEX2;

		// Gather noise data
		float[w * h] noiseData = .();

		int index = 0;

		for (let x < w)
		{
			for (let y < h)
			{
				noiseData[index++] = fnlGetNoise2D(&noise, x, y);
			}
		}

		return 0;
	}
}