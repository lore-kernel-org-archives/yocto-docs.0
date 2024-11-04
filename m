Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B629CD111A1
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:59:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.61217.1730735954696874477
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=gFn9RCmV;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso2987566f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735952; x=1731340752; darn=lists.yoctoproject.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayASSwvll9v9crHnFYThWz3fX8ok9vOEws4Sq3xfrmw=;
        b=gFn9RCmVzu0jJLP/ic+YBLMVDG8R4KDvV/iM+XerQnQzze+SxzN32vyH2qhQOBUtiI
         XAlUOSRwb6yfDZdKwkrs+97gLm4Mb6vOuYvkR9UzepjhVxHZGgTF7ATVaE6qc+eK4SvJ
         QBqQdt2uE3AFFskAptz4S378u1DMp0R3/6ZE4MwMRHD9Cmi/9nCAO7+BxeKUnnv0aaay
         G+4ni68sBnJX1uDU5garEObkXOFOyCIRu8rdwORFXKhR5w9m5kBRdMJOzKrtTo9nt8G0
         LuLXcjtIj7kGvPpR5IJrE7uFkX+fxzcUdOH+U+57YIJ//yLtUltcvzxV8f3pGe7nDs5F
         pKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735952; x=1731340752;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayASSwvll9v9crHnFYThWz3fX8ok9vOEws4Sq3xfrmw=;
        b=KHHWx2g0TLE/TXCxpPi9zS905K7HQMaQkB8wiKBlpVVc5hOBddu3s4b3Uo/EWeLFAg
         39iYFfwFTt312aks201xYyX8XabNwx4KOyXki39f3ftlk20JysLVwECsrVsgjr95qc1g
         p8FJ93dgiHDJkSDH8mnnaMp7n/kfgRrlg5QbBiKVc/V0+liWyGDxZeeK5hInhnqLSa9h
         qY+OFEkI6sWaAAPO2NypM5d7z8yVKwojHdooaPo8bOp8p8y5OQW6gHUmc0mDmSo1oOfe
         SnauqXzLyBuK3e8BN97CUfUIhXYseTbfBfQA3vmqRey3qv2eNzm+z0n1gJTp5fLwQ2Id
         5X1Q==
X-Gm-Message-State: AOJu0Yy1MI+nTmkb2NGObUugFHrSsaKQjcOp3aGUtNtXSKqVlrchL0NZ
	JzRqgPRB5Sb33LlWhTNnUCOa7382nH0v4l/15s0Ckn4i4NLzIuBssmSTiwztGv22NZD1Qo8rV+M
	oBPs=
X-Google-Smtp-Source: AGHT+IG5uc9dCo3CFb+J5Hcrwe/4DEdI13MigREF5zpj1SdFRlqaf8LMXkkDZgYJjn+SJpUmarxC1w==
X-Received: by 2002:a05:6000:b0e:b0:37d:4fab:c198 with SMTP id ffacd0b85a97d-3806115a9bfmr22202341f8f.26.1730735952524;
        Mon, 04 Nov 2024 07:59:12 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d49d4sm13581732f8f.34.2024.11.04.07.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:59:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 0/2] Add bblock documentation
Date: Mon, 04 Nov 2024 16:59:11 +0100
Message-Id: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE/vKGcC/42NQQ6CMBBFr0Jm7Zi2oAFX3sOw6LSDTERqWiQSw
 t2tnMDl+8l7f4XEUTjBpVgh8ixJwpjBHApwvR3vjOIzg1Gm0qrUaL1HoiG4B/rg3k8eJztlCSt
 76mrXNe7sDWT9FbmTz56+tZl7SVOIy/4069/6R3TWqLA0VDeqKYm8vZJdBqHIRxee0G7b9gXvg
 2h3wwAAAA==
X-Change-ID: 20241031-add-bblock-documentation-4a5f8cf9c6d2
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5667

Hello,

The main purpose of this series is to add some information for the user
the use VALE and SPHINXLINT on a subset of the documentation.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Changes in v2:
- Fixed various typos reported by Ulrich Ölmann  and Antonin Godard
- Split series: bblock documetnation was sent into a separate series
- Link to v1: https://lore.kernel.org/r/20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com

---
Julien Stephan (2):
      README: add instruction to run Vale on a subset
      documentation: Makefile: add SPHINXLINTDOCS to specify subset to sphinx-lint

 documentation/Makefile | 23 ++++++++++++-----------
 documentation/README   | 18 +++++++++++++++++-
 2 files changed, 29 insertions(+), 12 deletions(-)
---
base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


