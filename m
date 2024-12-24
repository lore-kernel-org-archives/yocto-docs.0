Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020E0E7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 14:03:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.33679.1735048986604119770
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 06:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H7OrS4Z6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so2770322f8f.2
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 06:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735048985; x=1735653785; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74iJBRSsbxrywiwsDfmZEBehBY+ePe98I8JgqQQO1LY=;
        b=H7OrS4Z6XnJ1NncymiVA1M7U3ujxGq6Fvizkxp7GU2Z+GkqZASJQP7crWGCXmA0NqY
         RawNlvuXYEzqTH4L2RaMTZKMqj+mYD0P4W4vJGstROtjIiSg5Ll94ugktkDKBcId+fOR
         PBT7PwsNgeMCWdzYsGbf5skCrdzCkCINHkflUDWjJMmCMX5Kzw4dhb57CFsQ7AJxCvB+
         LdrHI+w4fxsbaeGGg9w00BAgodNTfYBXVZHtwkgLY1se0OIg0Im79Q2QLcIdcxlQ+zjV
         d3bR6SGCuAgyJd7YIPt1CGHxSxvX8ddnuP8eLQeM4blxvGeLSqv289qbwWcHYqykCB1T
         Kpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735048985; x=1735653785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74iJBRSsbxrywiwsDfmZEBehBY+ePe98I8JgqQQO1LY=;
        b=mBWoIwiUcKAoLrb+izuhuOeZQ5XQ6vidRIQFi6OVNIp2MJ+/Kbbh4pYUVrTAkHOPe3
         suluSA+I6EXUfzYQ38mEyL8abYVQKjncFa2xuZHhMU4IZvknHE0yTtaI5z+0IWjQbpSX
         fjYkdeA+/1nTDUvSswRJBEr2mDL8SHg2hzo1mpMlcuvR0pMNpkGayEKA9xrSSZm2GkTv
         NXPAUztsCzgJItixLtc0M/lFlVYqNiw6haoPDx33hYuNr1csBaiuBVFRPmxyqdZN2vJu
         wGX/jmdIn+n6dVRZqcOCB+iwBVHf77A5q3uUbRwSxxMztdUl6RhlSMGFLTLqoJYuAZQE
         w/cg==
X-Gm-Message-State: AOJu0YxbdxBJQY3rrpDFLoVRIyvV50P2j7zg86KXLqHflRWaPmLrxjT9
	57woFniXbBXCFS+oYtPTAeDEXVaUdT0gM2HMVOCUdw4la4R9dk5UH23GrA==
X-Gm-Gg: ASbGnctjWODW62ro9x8dBDhH8Ys6PwgP8yAmwS2R76tPGJBog4On+uPLkS3+uRRLMOg
	gLZolS+Gj3PqbK0y8uBlTAj0//CEQo2iK4DIxjL/Fh/ixwT6RqlWIO5ntn+tFgXKQctXubrRoN/
	NxeJszzwqyqzOo/AgWXnmwGAEhFJr8tmoG/CONsRpb/tHoXM0FmVjT0XZ2IUUOrBd0Sq38lypgK
	R/QrVoQ871lseba+elJ5y/PsdZarWPzQgCB/LIXVFmy29+lWFrQ20ctXhCO1qftW2F5USBa4H7Z
	aZvQ
X-Google-Smtp-Source: AGHT+IFvi1ap1wjg8O1XU9ZmaIiOXCSkzFdDc903huUbLZhCq3ygiEvubqMf/DjLvf0w3HGISrdmUw==
X-Received: by 2002:a5d:5e09:0:b0:385:faf5:eb9f with SMTP id ffacd0b85a97d-38a2240484emr16238337f8f.48.1735048984311;
        Tue, 24 Dec 2024 06:03:04 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847214sm14204033f8f.46.2024.12.24.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:03:03 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/3] Cover systemd.bbclass and devtool ide-sdk changes
Date: Tue, 24 Dec 2024 15:02:13 +0100
Message-ID: <20241224140251.24389-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 14:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6020

These 3 patches are based on today's master-next branch. Feel free to
squash "sdk-manual: extensible.rst: remove confusing
post-install-logging" into "Remove debug-tweaks references" if it is
still on master-next or keep it as a separate commit.

Adrian Freihofer (3):
  migration-guides: systemd.bbclass do not add Also services for 5.2
  sdk-manual: extensible.rst: update devtool ide-sdk
  sdk-manual: extensible.rst: remove confusing post-install-logging

 .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
 documentation/sdk-manual/extensible.rst       |  8 ++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.47.1


