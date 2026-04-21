Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92723F8FA9E
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 17:24:30 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40480.1776792266090645948
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 10:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AGFQ9ufn;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso52842846d6.3
        for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792264; x=1777397064; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vCAjrQNWc5gZcC2MpmXyEglTf3rVMjSyBYdwZYZWPo=;
        b=AGFQ9ufnxKvniK5mN5Vkg4BpTAOY3I6K6tSIPNPro6YDZ8lRassQqzSeqHLyy8aV/F
         gd4TBiq+tHCZXM8DXVlUAcQ4Ni6q0LbiVBOZ8JmMKQhJ5zc9o+jyhemvBhGpQ7KV8CFM
         9gmS7aZO6+jeC9KKCGp5Hbd/PD/vlwuEvlQoGYs8D9UI9Op5u5iZwT6AyD5H8Xr9Melp
         etTtsb4trMoVy+1+UonlXo+7+WnqRy6e2FbQac/DEonI6uoKyRrMag5kTtXPp0ASr4LG
         qZTLh7ndPzIJqtntuAz3XvXkFbnatTUVn2M824aPkP8cj+bsEuVJJO4doCw3p+AZbJaw
         qfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792264; x=1777397064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vCAjrQNWc5gZcC2MpmXyEglTf3rVMjSyBYdwZYZWPo=;
        b=JDyHdOe5Gutd37dwLEyKMdmCcIbmyj0ialCWZbq4qmMZ02rBX1BGG+aIHCjAIv6NPx
         bu3TIJsgppyEAxPqKPcNeHr59DTqAZC6LLm5PDerXIj+KdFS14M2Jq3reN3naV96vB1m
         mxqYRrc3EjAN6Ef+lKOTWTaKH8ni/uDaQ3zNji9bbzOFY/y8GCQQMf52tmTIMUxwxL/8
         eZAN7NXV4Gtz5jIIrdgiXS+VoH05f+z03FGmD1uIHg0P+EdDNCuyX5H+C8wqxVVSY4Yr
         oAiVoKZoXBdzjvZykENWjHcFXHppLhffyMHtYX/df+Hq3DK6VUhMgoBSFGpi21l9dD9z
         DQBA==
X-Gm-Message-State: AOJu0YzvfUE2lISo/0LZHrN0W1vsgBumyNysWIo5ucZWchu4X4ZKuliG
	2bzEojkTpVLtC8kd6MIgatJWgvjJc7dL6mV0cwDjiUqhyM2YkbVxsmmnGda8NA==
X-Gm-Gg: AeBDieuw7m3/9E5g4PvIQX5KsF+DivpJZ+ebY795kjwfT8YYtQ77waxFY4i5RSJMX+u
	5ieAIb4uKC/fbQGx0/UDN5rerZj2NVi7oZ8NkD/hIu3waTWXqwBqykGaydBKuHe78srahQ42NLk
	s3ySsdFSjDC4hzEebNqYIotQk1y0l9HpocrMc10qvnQpYk8K+Qyzwd7S3PUyCIcbys1eUjsCP+4
	rf/hhriXaKAa1ZP3K+aqyWvcpRwTgfMOVvVAZ5Jg4QoG4IoNtRk/yI/diQ4NCzBZ7L0Rx1I0oqh
	c8mkS8LBwDKtobZMS3W/FnLU7/Su4BJUQCL4iftXQ0hNdr3AePwwISCh41MV0DXISloALmciIbC
	rFvQJGbkF3OZA4kK92t3TdACgAyS6a7ODyLF/jFNhjipXG5jSapI9IUPUaAbj20ypRjPt7gCacR
	8x+uyVd8tDjEszAk3fwH7YlxiHnp+aIkIHSp0mk46VBkPLJZ4YOfSQLJ/CgwvWvQkRwOmESlhCB
	9jT
X-Received: by 2002:a05:6214:c23:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8b0280c7eb5mr300159036d6.9.1776792264002;
        Tue, 21 Apr 2026 10:24:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm109150036d6.2.2026.04.21.10.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:24:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Trevor Woerner <trevor.woerner@amd.com>
Subject: [RFC PATCH 0/2] support bitbake blocks
Date: Tue, 21 Apr 2026 13:24:14 -0400
Message-ID: <20260421172416.1801567-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 17:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9300

From: Trevor Woerner <trevor.woerner@amd.com>

Out of the box, Pygments does not handle bitbake blocks for syntax
highlighting. As a result the numerous bitbake examples and snippets
throughout our documentation use a basic, non-bitbake-specific
highlighting.

This patchset adds a custom lexer to support bitbake syntax, based on
the vim syntax highlighting information in [1], adds it to the sphinx
extensions, and then goes through the BSP Developer's Guide identifying
and re-formatting any bitbake blocks as "..code-block: bitbake".

If this RFC is acceptable, I can update it to convert all such blocks
throughout the entire documentation set.

[1] https://git.openembedded.org/bitbake/tree/contrib/vim

Trevor Woerner (2):
  add a "bitbake" pygments lexer
  BSP dev guide: update to use bitbake lexer

 documentation/bsp-guide/bsp.rst |  40 +++++--
 documentation/conf.py           |   3 +-
 documentation/sphinx/bitbake.py | 195 ++++++++++++++++++++++++++++++++
 3 files changed, 227 insertions(+), 11 deletions(-)
 create mode 100644 documentation/sphinx/bitbake.py

-- 
2.50.0.173.g8b6f19ccfc3a


