Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7D8C433F5
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 23:28:06 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.22800.1639956485116823875
 for <docs@lists.yoctoproject.org>;
 Sun, 19 Dec 2021 15:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DJvwBxrx;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 193so7805577qkh.10
        for <docs@lists.yoctoproject.org>;
 Sun, 19 Dec 2021 15:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=BMsT6FJMyTl/xerx05hdpmNQgSzoeAwA0v2DAxBJC6Q=;
        b=DJvwBxrxnMSxgrmjBf6cXrav4YIqDXOs7MxcjyA0MwVV/mGEMqacB9FGISt6uWL5mR
         TX4qjiKa08QzvizByNUzjCA7PIbTR2ICvo4ZY505X3nEQu70AkzS83B9eg/egvlEW/Bd
         AoGBJnx2J/4B+6cXRNSkhDWwhUlykx1FKOy4l7KuelMr3poW/6eaCnjhrdHqy41Ua5pK
         VakkF3JcxoonWcX06k1I/KWUcSQJIfde430arZaHtKOAllq9Crd4XXx2Fa7hQpkmpqKq
         rPtKWaLfDfKReH35IHkGjJ4l5Q7fOLuKk3Ug5dJW43NIiDMHLs1nUj/u8BKHTY3Ltk73
         7eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=BMsT6FJMyTl/xerx05hdpmNQgSzoeAwA0v2DAxBJC6Q=;
        b=YlQWAJplj0P+47T+1A6MG+AP2jfLsuFsHlf9s7npIqFY0P15an5Cjh/jql8eHEvAhP
         ADU3fSN4S/JNknlFHj4LzVidEGy/sb2ik/oMtaC6P+aXZi0mULqjFizaQgC5yLljde1u
         we82g6HtweGNSyUw5qW3GTzns8ADlCFNRcDO2W7Fb/3WSElrtDGWn9JEYmiSlQbMzb0g
         7ySEoKQ744CHz3CADGMEyWShlzG76dwbGKQ1dhpF4nBQ/ES4CKtJbOMH+FjBI0Og0kdI
         Ym1dTTAwlcSRtFmtM6ZR+DWHkdumOvEhkHcyV+PGrDw5tfmXID54t3GSuLHKxzHduoXb
         2iAQ==
X-Gm-Message-State: AOAM530elO6gPTn50BoE+nc+rE+kJt/bmNwRGhXGdfrQol27NK/6sgcu
	Au2xh20Di/ErAIKFQxILsPuL4o1BZqM=
X-Google-Smtp-Source: 
 ABdhPJw5Dj4HdJ0jIFue4CWFp20EXQCjcUos1ha/bscbok3C9UBxajR7lYVy0orK7D+gLGcksT+5XQ==
X-Received: by 2002:a05:620a:f10:: with SMTP id
 v16mr8248032qkl.36.1639956483941;
        Sun, 19 Dec 2021 15:28:03 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id
 8sm13718331qtz.28.2021.12.19.15.28.03
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 15:28:03 -0800 (PST)
Date: Sun, 19 Dec 2021 18:28:01 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: linking externally to the latest branch
Message-ID: <20211219232801.GA38509@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 19 Dec 2021 23:28:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2316

Hi,

The Mender documentation links into the Yocto Project documentation to allow
users an easy path for performing additional research as they work through
the Mender documentation while working on getting Mender working in the Yocto
builds. Many of those links (from Mender's docs) link to the Yocto Project's
old docs site, so I was thinking of updating some of those links. However,
Mender only officially supports Dunfell (3.1.x) with their free offering,
so when a user clicks on the old links they are forwarded to the new Yocto
Project documentation, referencing the "latest" docs release. This will
inevitably confuse users since Mender is based on Dunfell, not master.

The Yocto Project's documentation site conveniently provides a drop-down which
allows users to switch to the documentation for a given release, but these
releases are specific to the exact point release of a given branch.

For example to link to the Dunfell documentation regarding read-only rootfs I
could update the link on:
	https://docs.mender.io/system-updates-yocto-project/image-customization/read-only-root-filesystem
which currently points to:
	https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#creating-a-read-only-root-filesystem?target=_blank
to point to:
	https://docs.yoctoproject.org/3.1.12/singleindex.html#creating-a-read-only-root-filesystem
but that's specific to 3.1.12 exactly.

Is there a way to replace the "3.1.12" in the above URL with something that
means "the latest 3.1.x"?

Best regards,
	Trevor

