Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74A7CD4F3D
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 19:19:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11690.1778959133561420251
 for <docs@lists.yoctoproject.org>;
 Sat, 16 May 2026 12:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aLy6ImaH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso4545575e9.1
        for <docs@lists.yoctoproject.org>; Sat, 16 May 2026 12:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778959132; x=1779563932; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3BMoDOBBsGpvUqICCaf8rBF/W+1wm8/6IiUDFfuENY=;
        b=aLy6ImaHBkhagNxxBKPANdjWlUR7UsObVlN4KKMAeVB4iw7EEqhXSkmE6CRsfYFFcf
         z+OZh58oZODYUPffnY6WgLn8/qoNx+UuhxU9fSzfLl1w+jwBuZjacCIQ2gLOMhgLT1gd
         EjZcxeeJjyeOOmlVgT2XcYa9iPiS3ZhWJTK7q06poc270HPgCg1GMcaVKaeE6c0d2z8c
         Xg1vUa+3E6QgL23JmcjdGu8/WGrBERF9OION4lUxkx/ZC3lbiJq3X1+O81/dpq3hsqfl
         RI4bwbUEHRaEykDPJAz7H4OqvViGN8YKB5qp0bWbslEUOyYGEvFc8cu6kv/a6iJarxqt
         DBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778959132; x=1779563932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3BMoDOBBsGpvUqICCaf8rBF/W+1wm8/6IiUDFfuENY=;
        b=Gfxps3AgK06ZNYCN31THm5t7aMvLZ1XpgKRyzGu8PbTLOlBS1KNqRfGYau3YcaA9Pr
         PN8lfZZg7B6KXjXVg3mmBB5wm4PvNhkKmFa8KmazcUguJ05wy5BVfNFuVrGdjJo6s5Pb
         oMZGiUVfmvgUwrzmHbvjLHpPZIOpU9dnlk8BH+Lg+Ehvajw8A/bq2xlkrfSxnzw7XXCa
         7P0Sz4vNsj+gN3BeYSIehOokWu1aSTu4fU4SHGniYpQ+hCsJRs6tTQeItNQw7OjVrQZQ
         vN51r+i7v33Hvfd/wlciG6DP7YAgoLXZeyZhXEYIhJW2e2DV7rrlPAgwoPEY3CZ9ikqt
         MWOg==
X-Gm-Message-State: AOJu0Yw+SUQTz4lcYO9EHxFBMQ1hQHDiO3ErV5wBekB6XDbeP6TBa6pt
	icp38UbCxs8mZXAsuqxX3eur3UaceOANSKhG2KFX3Vl9a70RJyXsd+Rn3TYumvVllJo=
X-Gm-Gg: Acq92OFGL+XiHBJJa0RX/KcXSPtx4G6VGc0kYM2n7rKJqiCT2T0SlQCb5wx4KcBDhBl
	bCDBKRXBSLaH28zDKZMAd9y8lZYlEb1pMKj2kbNloBLL2rQ+8aIHEqTXFGBu6ORBlUiKG5biJ5s
	YZWQybTZPvsLwFhy6zFF/++5TB90J7bmJOFadJ+9mhuB5o9iAcVw5L1E3w0hacyfOuCgIc6ihyx
	HhXvG9AkFOYDmYW8YCUDFFc3jSIEJ0jU8saK1EvBUY0cAyDGigXLqCViDumzZ6tE+R0wFCotc0N
	3XYgZ3MwNC2St2dPnZV50anetm5mP0ZlXmAcvHQX85roLtnCMQLHO5vSyvp8bQQ3cpWdi3SAsZt
	SYSEJ/TAVn4NqtL9JPJy8O/jV1dedHuUbILvzod7DQS5yNBiKce7Q8Y+BX8oc7Op4afHmNbiRml
	pIjVxRonxIdDhDCh8pY4UaB7lgjUWpkoUYHVF/NMbtDHSrY1hqxVwAJcB6jJzpsU/Gf3XSGQCbj
	oz+4BatzwSlixbp7HGZwHzn+G8DprHctxlgOF3R
X-Received: by 2002:a05:600c:a30a:b0:48e:62ec:f264 with SMTP id 5b1f17b1804b1-48fe61f29femr101121045e9.17.1778959131822;
        Sat, 16 May 2026 12:18:51 -0700 (PDT)
Received: from thinkpad ([2a02:8070:d188:380:5f4a:8ba5:a0d5:73db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm144307215e9.4.2026.05.16.12.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:18:51 -0700 (PDT)
Date: Sat, 16 May 2026 21:18:49 +0200
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, quentin.schulz@cherry.de, 
	richard.purdie@linuxfoundation.org, mathieu.dubois-briand@bootlin.com
Subject: Re: [PATCH v4] doc: bitbake-user-manual-metadata: document
 inherit_defer limitations
Message-ID: <vpgocbyuaxrhczw2veodifzfrgsbpvo2ch5p7uuadowrspqnko@clwjpomtgpup>
References: <20260516191137.11033-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516191137.11033-1-bijak.dawid@gmail.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 16 May 2026 19:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9473

Hi, 
Sorry I forgot to include the cover letter in the original submission.

This is v4 of the series started in [1].

v3 incorporated Quentin's suggestions from [4] and [5]. However, v2 has
already been merged after I submitted the v3, so this version rebases
the remaining changes onto current master and reduces the series to
a single commit containing the remaining diff.

Changes since v3:
    - Rebased onto current master after v2 was merged following Matiehu's
      remark at [7]
    - Merged patches 2 and 3 from v3 into a single patch containing
      the remaining changes relative to current master.

Changes since v2:
    - Link to v2: [2]
    - Picked up Quentin's Reviewed-by for patch 1 from [3]
    - Applied Quentin's suggestion from [4] and added Suggested-by:
      Quentin to patch 2
    - Renamed VARNAME to VARIABLE as suggested by Quentin in [5] in
      patch 3
    - Dropped patch 4 following NACK in [6]

Changes since v1:
  - Link to v1: [1]
  - Split single patch into four
  - Shorten the override example explanation
  - Drop the "footgun" example from the previous patch

[1] https://lore.kernel.org/all/20260424062327.820993-1-bijak.dawid@gmail.com/
[2] https://lore.kernel.org/all/20260501091418.76994-1-bijak.dawid@gmail.com/
[3] https://lore.kernel.org/all/aff89f3f-7bc6-4634-b834-1872d559c8e0@cherry.de/
[4] https://lore.kernel.org/all/fec735f6-f87d-4036-a013-384ed7c54701@cherry.de/
[5] https://lore.kernel.org/all/a3a8a5c5-81c3-4764-aba6-32c84ce55a7e@cherry.de/
[6] https://lore.kernel.org/all/7558cb67-4ee0-4cde-9d43-4ce2b8d1ef5f@cherry.de/
[7] https://lore.kernel.org/all/DIFUR95B2LWG.3GMMOVGQ5SIVT@bootlin.com/

Greets,
Dawid

