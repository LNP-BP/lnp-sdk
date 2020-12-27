package org.lnpbp.lnp.model;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import java.util.HashSet;
import java.util.List;

@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class OutpointCoins {
    private final Long coins;
    private final String outpoint;

    public OutpointCoins(Long coins, String outpoint) {
        this.coins = coins;
        this.outpoint = outpoint;
    }

    public Long getCoins() {
        return coins;
    }

    public String getOutpoint() {
        return outpoint;
    }
}
