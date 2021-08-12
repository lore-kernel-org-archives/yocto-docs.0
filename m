Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.26723.1628795067632134781
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 12:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=FOx2siOP;
 spf=pass (domain: qtec.com, ip: 209.85.208.179, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f179.google.com with SMTP id h9so11988657ljq.8
        for <docs@lists.yoctoproject.org>; Thu, 12 Aug 2021 12:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HFZPHNKpAmpNA5kiKEux97F62y8xhjKypNgJWGKBLM=;
        b=FOx2siOPnxEm45ECb3oLKNhk5udSdK9a4tGEzKm8HYasWU6h0MYQJsbhtDjS3OyRqo
         Qup8537erGYZtnpZ/BDYmZABW1nOxXQ7MR+YSsSOugipT0ftmPugM/DudELMkNVK0eyv
         DIwLJnmJhjE5N5B2MMqYimxltQlfAqtwa9MGVC1ZnrZGFdvSrJcpCJMv4JUEnF1bawQs
         VQqIVKVQvoVGxrnhwyEYdbbxTR3tmFDBzUITdQiUHaNSArUXKZBtFUJaMIs95o1UyAVj
         H/CcHyJdVP25QvE0Yo1T+/HJ6rG8gc8VQMqLp3DbB6tdly/n0QWaLWfsBh/LXQb2Uhok
         QyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HFZPHNKpAmpNA5kiKEux97F62y8xhjKypNgJWGKBLM=;
        b=hZcJbfqLTiOoRywE7YJBkppzYXofuh8reoFYqAbvlroJdapM0G7IXifWp2y86PN4nI
         XhxSPXvO8Y2enxY8TCPpbTVpJz2P5j0Q71+07lkfj6Lz4WMuKS660co0P+Ip1i2rwuVM
         Gb/Cr1P8HzjdKjtt4rIgRwyFdjCC6gzD9v7FGhtV753WKO9dGKjsf1pYZgEGa0pbiEfi
         e3ELR25fQ3vhO5yax3u2ijdvT2Kx2babJbSMxeW5PY1oTgmjsnGJbJQRRKl0uevmzGAP
         DvMYGrJ9kv/qV6LACJNfSQ5F+iMweUY0a77dKIPT1tnZgB598ljasPcRyTzx3PQisadc
         E9mQ==
X-Gm-Message-State: AOAM532ZLwQVXXH/+IHALGbx8GhtCz2WNOeh3ZjfwIo1udJkGS78WwQw
	64sJzwhbaGgz6tIE8JpzmN4+BupgmsJOhqzWfEw4u90d5LBKYIg5yIp0zwv2ejq8Z6sgazzRU+m
	dzwYe6hse67r6FU8h6NvVxYq7i9Al2XhlmfkO4f146IS13RoGAhRIvWyp/SdCwcKCRzPdIcaUbQ
	==
X-Google-Smtp-Source: ABdhPJx43Kb5xLRPIp56GnMS7Al09CfBpYnYbhG3eHLTcFarOm9o9wS1RfFG/x5E0IUGJdaBr9ZFIQ==
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr3921782ljm.342.1628795065283;
        Thu, 12 Aug 2021 12:04:25 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (87-52-47-7-cable.dk.customer.tdc.net. [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id q14sm343859lfr.87.2021.08.12.12.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 12:04:24 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: docs@lists.yoctoproject.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [PATCH] releases: fix typo
Date: Thu, 12 Aug 2021 21:03:09 +0200
Message-Id: <20210812190309.347619-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix dunfell typo for releases 3.1.9 and 3.1.10.
---
 documentation/releases.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 04fbddea3..3f9646407 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -35,8 +35,8 @@ Release Series 3.1 (dunfell)
 - :yocto_docs:`3.1.6 Documentation </3.1.6>`
 - :yocto_docs:`3.1.7 Documentation </3.1.7>`
 - :yocto_docs:`3.1.8 Documentation </3.1.8>`
-- :yocto_docs:`3.1.8 Documentation </3.1.9>`
-- :yocto_docs:`3.1.8 Documentation </3.1.10>`
+- :yocto_docs:`3.1.9 Documentation </3.1.9>`
+- :yocto_docs:`3.1.10 Documentation </3.1.10>`

 ==========================
  Outdated Release Manuals
--
2.30.2

