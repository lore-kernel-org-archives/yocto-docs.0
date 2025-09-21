Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0176CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 16:43:32 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.32691.1758473003722877265
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Sep 2025 09:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdrBed6F;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bhstalel@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b07df8ff907so77139966b.3
        for <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758473002; x=1759077802; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYVIjLFn6yqNfcCvO/BtmnLkJtZX1qStG+SZrTQuuYA=;
        b=VdrBed6FI09jBC823W6EdQx2xdMqwq2LjnD/nYczNj0+/L35n1h5Z1TVeY+g8FE4SJ
         dzw3eQIJvmSPZXJjpawoDMJWfTD6kkT0Ve2qtb223v6O0zXRl1vO8Vfyu6Be4dhGjob/
         YT+x20sw3z+SP7G28by6B+02Hf2er/VZ4+n794hJmn4SJqQngs6v/uShWQuKsmtFPHvD
         fKEw49/MvrQdvY8r0NDjYRCcO/joJ7uz0TV4IldNvkAeXPB/D5yMAT/WGw0IE3r4CakB
         jRhWRDZo60/Nm+rL+xtgm9/PsfvKOoXf665Xf3pIRqbu1BoTeSNrsY+dP1jemEdbHHRc
         3RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758473002; x=1759077802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYVIjLFn6yqNfcCvO/BtmnLkJtZX1qStG+SZrTQuuYA=;
        b=KL5F88ZBKuKCqhdO3P/8NNlkMHH46WNEor64dpRoCg8s+rrjDAfHNExizmtx0dF31D
         j+ee36+JUgU7VAUm7/JZIN7QF7Ph9Fj7JAVNk2cpGTNQ+fOY9Way9GqJ4grSIP34/Co8
         BsfYJ1/PLbMQA+avzGMcfM2gvWfJ0+5wuIiKao9Fwu8k3v2X7JNcC2spHCAE37vSc2qj
         cN5TsnfTcHMZomd/dnlHOXB0kp5okVigGOWMyQwsUFfOvs0fi5XHC9mVC/YuFHru5jrl
         YBnuqv45JzqAt1uddSInNuOATpLr2yCmUqE40ENt0tl0V8/dfenYAcwB84WQraTeExmZ
         tCCg==
X-Gm-Message-State: AOJu0YwwFxC7HEvR96zlZzAc0w9Yj3+KVAgTJpORP6qzWb6lAuY/oe1T
	FeTKC3VFfqp7hzPGJg2lzBHrK49jx+SC+eOIZmkNR2QIhYm0ObzasymPgCwucw==
X-Gm-Gg: ASbGncuhWNnW3kOhwPbCMrg6iVRBQSoVSgMty1GwYYw7tusCHUVGHUQJC//S9nm+XpV
	fTK7dqiK5qSl0aqqCovoA2lyybI8/WC5ZsMU7yq+qzPud9ZVta6GpG8KKFogplgI/qsaqBMKVAT
	GPoNu/xPWCL7oFxFnXwAUyGg1rkS25xmkI3VLlBb9gsSZ10vgsGTZihQoBDZGNlc5SBgjrz1Gzl
	PPbBMYjKVgv0/4ud39O4sXgB/0plZZG9NbrY6Jlo9QRSYHOHhZzA35XylvcvjBRN3139iSuLwNx
	FwLlFOTMOza7eY8v+Y/WNLxyuHyjVt3fAdUyN/JCCqanb5EGrikeXDocg0IZXg3/Q4a4pe1tepG
	gGKe3Gm2Mhy4UJdgvYX8=
X-Google-Smtp-Source: AGHT+IEOOcSzGsc560at74I2q0w4Mqr88kOh8v3WKBPpnFMSb31VxGDIRSyD4ustREg8ndMGCnTH4A==
X-Received: by 2002:a17:906:6a11:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-b24ee7e4d2fmr498496866b.3.1758473001638;
        Sun, 21 Sep 2025 09:43:21 -0700 (PDT)
Received: from techleef ([102.104.117.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63203b3b075sm2558020a12.31.2025.09.21.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 09:43:20 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [docs][PATCH 0/2] Add more details about the behaviour of the base class
Date: Sun, 21 Sep 2025 17:43:04 +0100
Message-ID: <20250921164306.53501-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 16:43:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7568


Talel BELHAJ SALEM (2):
  ref-manual/classes.rst: add details about actions done by base.bbclass
  ref-manual/classes.rst: add diagram for classes used by base.bbclass

 documentation/ref-manual/classes.rst           |  15 +++++++++++++++
 .../figures/base_bbclass_inherits.png          | Bin 0 -> 168001 bytes
 .../ref-manual/svg/base_bbclass_inherits.svg   |   4 ++++
 3 files changed, 19 insertions(+)
 create mode 100644 documentation/ref-manual/figures/base_bbclass_inherits.png
 create mode 100644 documentation/ref-manual/svg/base_bbclass_inherits.svg

-- 
2.51.0


