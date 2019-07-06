<?php


class ResaleCalculator
{
    public static function calculateLowestLoss(array $prices): int
    {
        $minDiff = 0;
        for ($i = 0; $i < count($prices) - 1; $i++) {
            for ($j = $i + 1; $j < count($prices); $j++) {
                if ($prices[$j] < $prices[$i]) {
                    $tmpDiff = $prices[$i] - $prices[$j];
                    if ($minDiff == 0 || $tmpDiff < $minDiff) {
                        $minDiff = $tmpDiff;
                    }
                }
            }
        }
        return $minDiff;
    }
}

echo ResaleCalculator::calculateLowestLoss([210, 130, 50, 175, 100]);