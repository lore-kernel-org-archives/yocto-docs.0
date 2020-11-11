Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.11196.1605120128829581220
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 10:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RHIGtkWw;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id w24so3297155wmi.0
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 10:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JXCPbQr88Y6L8M/MJ+o/0R1zNyyNVvCuinqT4O+5mEQ=;
        b=RHIGtkWwT3ULYwiVD5k1S/9bj5OIPJJrVyWQc9y4KmMZj4GLEp7z/9nLnkgU6hwTBR
         /450fV4kjxrt3/BQfSrtqL1eNZ25HlkDHnEpHI60cE39a+QhdDQDBl/tBw0y5mU8Ot4Q
         NVH9pTWr86f+BdyYbpyKsRNUulXdSlvc+2TP4nzwfg1FkzKP17SgtofLxSTp53c32QED
         VEyPG4+0vUayDuqjc35w/VIy39+EhqK+T1QesXPXtMB5cCOorvBnPv2IqgCaZDZOErcl
         mGAlaWutY+EzaHlUvYGvRtJMvdGwndqWw8bjhdt7z2Bhx7Tp+AN6yqu2RztHO8vLwdfp
         Jc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JXCPbQr88Y6L8M/MJ+o/0R1zNyyNVvCuinqT4O+5mEQ=;
        b=lRZkccsoxSJOdKxvlxu6TOXdugVrVSJ/lKNKtmukm5zfVbZNi7/TcGXHx96csAgWKv
         9Wpw/j6FusqRxO14qlx93PkicZT+CoTMbNJ8SCubeU9dBEb4VlteI5szvywHNmvOqRe1
         ii++2TuhlAvmGHW0qB21q1hXLqTLlKyqLpp72pRnLyy0FMVBC7M8i3U76pJ9YUvZ5cQ0
         4r+zQZCAINF7zHcLKDPuScshl8MzBnzsn8PZBPZulMAw7mg/oHNHHDy9MDyCeO6jKUwE
         JZoWdZv/NLku/08lIP32+kUA6joQDO3bP/SNwzATeHuogxvmWJGJGzKc6gZP1Hm3AELe
         l0wA==
X-Gm-Message-State: AOAM533URH2BswxVd3whXRZvZqrNhAeSP75DyRhmiWLFJ6HX1wau0Hks
	La+fDzS5irtQ5m008X4BzYjlLYt49WO5ccr5
X-Google-Smtp-Source: ABdhPJwDh4E3EunXKggzQxqXNyL04HVu7an2ccTMXOjJaky57Fvh32fkHvcppqFf9chOC7N2d9hQIQ==
X-Received: by 2002:a1c:e1c6:: with SMTP id y189mr5446508wmg.94.1605120124052;
        Wed, 11 Nov 2020 10:42:04 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id v67sm3673657wma.17.2020.11.11.10.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:42:03 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/2] Update poky.yaml
Date: Wed, 11 Nov 2020 19:41:59 +0100
Message-Id: <20201111184201.104015-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file was not updated for 3.2. These 2 changes should go on master
and gatesgarth. Then we can update poky.yaml for master/3.3 later.

Nicolas Dechesne (2):
  poky.yaml: remove unused variables
  poky.yaml: updates for 3.2

 documentation/poky.yaml | 63 ++++++-----------------------------------
 1 file changed, 8 insertions(+), 55 deletions(-)

-- 
2.29.2

