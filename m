Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF5FC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 22:49:28 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9866.1787611767112599946
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 15:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GVfrXRtL;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e99ef0902so206197885a.2
        for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787611766; x=1788216566; darn=lists.yoctoproject.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DO0BK1/dq1w7wvkKejqYWYY8FyXkE/I6Zq2xAvHSRkM=;
        b=GVfrXRtLymYaKPTRGs6wHqkqEXfY6vBYpF+zky4l8kKbPYQxBvF7fE2ba2XvtrVKFM
         U01XXrIIF3WfyYZCOdGRlsnbswTr9C1yaSmTcJQpziSfYjaUXlD2tNAykxm1Kvuu3P/v
         d2iuxgcgtHyEROI59ibB4zE+tUzdpu30ON6nPYLGhuLmtjX2PdEXWNqcb5rkSVOgpiPY
         2cKGfWOk8XRCRwESpuF8f0Bhx2TNG0dcF0mj/Ak+sj/xxn3gNqW7w6TAsj39GLiTbhBO
         vVk6VDzC98p17DAZF4LY96fX5RhvNUkswZLhhBPBqVvihgk32OVRhtGTi9FWwxojxz4O
         f7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787611766; x=1788216566;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DO0BK1/dq1w7wvkKejqYWYY8FyXkE/I6Zq2xAvHSRkM=;
        b=C9Zy5fujdJtYEmKxMZbrQHOG7gR9ypilvc8pk7fDOHoMMrhoQkNSZBVPY477RI/4fm
         bD5QL1K6IFo+YMliaEP+2f6nT6hlyRqmu2wHhDbBmBqwouq1qlpm9cd7Q6Ll3+MRvnr3
         zFWl03A44Aqlpf59m0SQuI8R1RSjwwKXWEFqiQXlBLgwulGPRCJcI/BXJZHGWPbLuT13
         jKJchliniP7YSSby0uKphSyap3W0XNBfne0Fw3VtWqTG+v4/SRxZTFCYUYVcdSjIxuyo
         Zu3oVJwF/Eh1eBIG39J3sqc6xyTH3KG46gUJDsyNCncAH8lQb0CfWOXtknGEDoT15Xcg
         oesg==
X-Gm-Message-State: AFuF++lI9kciCs6bUPm/YoSZ51cu1V8bJGPTJfUUjpcxzxjOUDXW8FS8
	DuddlyuetkgTEFS5+p5VfqScqWC2ajISuVesD6/LbPnopKlxz25U7S3KOK7BnJ1F
X-Gm-Gg: AR+sD12VmLAog44UXsUbNBAoTISVPxssmlzrNuI+mIzue0/Buvru5G3YuepqJLP1upJ
	+oTsjCkaHNb+6rkQ39zQD81smc8mj9M7R9gBcHoc71OgQL3NCrkBxFs9yOlgEeq3AN/FVV0Show
	j8Pdhwkm4kXNX6DAcM9+iu84H5Oq6rOYxzGAvqs6+wFg1qsUKeZkTMF0lgvLw53GbN7mQGAb6J7
	JLMBNAk1yw/GMRiWHbfu2ge9gjf387ubQIRSX9K6nNJpJgALaEjfjWyRJa97lXs3Mx2LbMZuxFZ
	1hzc/fXCFbq/SgJrdiBaU6UBMS6LHcyE2iD+070Z1F4t+3FmYlSELfclS3kUhvSEz/ALgXBl3UG
	vUmsSVIFMxWlw8BKE1gumGW61U765+qqrOxO9RqYN7pVOm3oy7DlO7F9UALdNHzfbE1LCYqYaa8
	coHyHWJ43IL+vZldLsS1IuSaf9CKUudRN7RjNV8swmwLe5onpAvGePg7V/gbbUay21UJjIKj5nq
	W4AcfH9peUjbnG2QfKpY9jjJI7vNEo=
X-Received: by 2002:a05:620a:2714:b0:92e:7c7e:9c9a with SMTP id af79cd13be357-9373952e0camr2779215985a.31.1787611765989;
        Mon, 24 Aug 2026 15:49:25 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749ea4cb8sm595818385a.41.2026.08.24.15.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:49:24 -0700 (PDT)
Date: Mon, 24 Aug 2026 18:49:22 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: request a rebuild to pick up Pygments 2.21.0
Message-ID: <aozKcnogXKWfOiFA@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 22:49:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10335

Hi,

Could someone build buildtools-docs against current master and publish
the result?

scripts/run-docs-build line 29 pins the docs toolchain to the
yocto-6.0_M2 tarball, which ships Pygments 2.19.2. The newest
published milestone, yocto-6.1_M2, has 2.20.0. OE-Core master carries
python3-pygments_2.21.0.bb.

2.21.0 is the release that added a BitBake lexer, so it is the first
version in which

	.. code-block:: bitbake

does anything at all. I have a conversion of the BitBake snippets
in yocto-docs and the BitBake user manual ready to send, but on the
current toolchain every block would publish unhighlighted - and since
run-docs-build drops the Makefile's -W, silently.

I've tested the change. run-docs-build feeds every BitBake docs branch
through $builddir/buildtools unconditionally, and yocto-docs from
scarthgap forward, so I built all of them twice - once with 2.19.2,
once with 2.21.0 - applying the same docs-build-patches and master-file
checkouts the script does:

	bitbake     1.46 through 2.18, and master          14/14 identical
	yocto-docs  scarthgap styhead walnascar whinlatter   4/4 identical

36 builds, same exit status, same warning count - zero warnings
throughout.

Best regards,
	Trevor

