Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633E5E7719E
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 22:20:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5635.1736461229171635304
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 14:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OK0eZS8J;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1025000f8f.1
        for <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 14:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736461227; x=1737066027; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgNlEb4yPg37BY6FtvY1o4rwjTAWDR/L8UAjimrei7Q=;
        b=OK0eZS8J85fVi7EBnPFkOXmxINKYAkamOPgl6CEtcJPw/cAFF5yq1eOtRde878jsFg
         hqfvpsXC5iVfpZj5h8FIZf0rf6fJ6fuE5HicPF1bTK/+pjVCtKrXJUvG7g2HK9zNedlf
         f0g2nJsAvtJFlQIrwqU5cNwhwzoiYRvsy1ZjRcKy83p+XDiJxltSiVCMtCnEb/IFGdNG
         JR5Q9VvAKu1q7S1rxei70Xn2xAt1F6Zrkt/fY66G3I9FlbKQY7EIvYI1A2fYVs2N1DOi
         ijt7xcRnyINbqGaCd9kPY0SUpZpmV+bLSx0G8yy53ARF6j4w2qkk0afJmvFDPbx1E4gV
         ujSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736461227; x=1737066027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgNlEb4yPg37BY6FtvY1o4rwjTAWDR/L8UAjimrei7Q=;
        b=uLrWyo5z3eqgsjYtIjrka+eaDyPYYdlOa/A26iNe7DBb90OmveE3U2PgLBb+2iTCJ/
         NmmRED2w6HZdJBGm/L8l2QEo+/PDixINOeT5Z1ldbYmhAx/gbrpV56pFFzn4y+xwf0J3
         n7Kaoc5Mip0H50T/0WOBQpINbTfKy8cWbVfcvko7q3/q+/B2n8O/A3hqtfZS+Va0Lknb
         jUJjKL1ISAaI/BB2CebTjzmhDrlE7DEVINU4CHEgotWQsaOBIL43a8OZr3QmNulke1nv
         xFZUymb296YXwziXstAX1dUjt2TlBSYtgkw5msgZiN0Omgak6lhgVGYYXTrvR9pcIOS8
         PNCA==
X-Gm-Message-State: AOJu0YxRs5ln2DgH0yIgdQPvixgKBPP+zZ3tUHsrEv5d6v4gCLfsd7o0
	Pn8hh/BOoaS82hOJGI29TR8wO6F8HfD3wgQIBOdhB71/ZAZoK5h8NrJhkA==
X-Gm-Gg: ASbGncvqgnXpQemU8Tev4B+QdK8UPrlaSVvZUqsDotwOQCX0FpwZ78sp6NeHXOsKt4A
	AOSAVXbqo9AK0rcwmLAja7A6gFGkahfb6Bs9v/TYYwnkeXnvHb0NfG7Y7c+TowXz2CaGOnUYC+h
	74lKKOUkPA5acw/RrXt/xH1Fa0b6vYKIayRS1VNBT04thIyTzwv+uVd2PK4jnhXhR74frDE/2Tt
	m5gRUHjUXkQLx6WQTZzPi+M/6jUNAQLswEPQgPcFtphNwnQtML37WZVJMuhpkQE0B7mtxW9SxAI
	hghN
X-Google-Smtp-Source: AGHT+IHfXCAWwP5MpyHclhkc9/7kb1KqF5pVFJ3vqZmvlpdYJGxw5BSEibzIDZDE0NC9V97OF4Npbg==
X-Received: by 2002:a5d:47c9:0:b0:385:f470:c2c6 with SMTP id ffacd0b85a97d-38a872fad4fmr7058767f8f.11.1736461227091;
        Thu, 09 Jan 2025 14:20:27 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1dc6sm2853265f8f.96.2025.01.09.14.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:20:26 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/3] Cover systemd.bbclass and devtool ide-sdk changes
Date: Thu,  9 Jan 2025 23:17:18 +0100
Message-ID: <20250109222015.12658-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 22:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6075

Diff to v1:
- rebased on todays master branch
- Folowing all the suggestions from Antonin
  https://lists.yoctoproject.org/g/docs/message/6034
  Thank you for the review!

Adrian Freihofer (3):
  migration-guides: systemd.bbclass do not add Also services for 5.2
  sdk-manual: extensible.rst: update devtool ide-sdk
  sdk-manual: extensible.rst: remove confusing post-install-logging

 .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
 documentation/sdk-manual/extensible.rst       |  8 ++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.47.1


