Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6EBC5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:23:16 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51129.1786443791686210628
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 03:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gq1rBgfc;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so18123726d6.3
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 03:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786443790; cv=none;
        d=google.com; s=arc-20260327;
        b=f1pWV+ncqINEUm1mpfckSAmWBAxhNDr6bXdvru8qyNbsgyhLUXlQTM4IaMnhiSye5Z
         zDXwgEz7/tudeTq/v6gS0k60oyfoGLFWQTih+wanItoS2RiPdZXhWbUUd0r5omY2DeKV
         nJx5Pf77JPUUJ8RzmnZh1fM5EIdESY9y4bgDlp3twV0bZ+8R+WUapxPcreJnwqUUddyF
         qr/hJU37clc7wafOvasxJs2VFFaO4QXfSukZNACcL0unTVwTSVXnkXpuriYptbxKBfuW
         vE1O5xwKsoIy1VCVcHqyDHqaQoEWJeHRncN02ONKqNYVH6vKWhBZZa+WdvjVJ1TQ3koq
         Ypbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cysfXdPj+YdmREOFo3GGT4v0uNQet+l8KAd/YoYPd8c=;
        fh=q0c6mJMutAO2+jw9klPYyfqPGTcpL5a64TpcJR0Mz44=;
        b=WjzUeWZ+PLOKj/SDMBu6GmubCg9lnJt/TjvN0yK5nxBuZpAwgaqaXi/NfTLbNOa235
         3mNHIDDLgdEzCDb3yKGPSni1aoGHg5hoCIxoKiTouex83GgAgkSu5lVcHDPfsgURMfQN
         qiy0nuOpadbkijhFH1pH1foYNG2grbbbZ9rauc3t/qzMXxQzhyBo1zhXme+Qc/TwQU+8
         k7jvHugTrZKOjiZVJp7gpjIUkeZcQM3RG/Yh3xCUVZxR6oZvmZPkwp7uNLwyDSj1tBkz
         pZQ01pxAVegSwdRtkyOrr3RUeDngDgMY8QHtCHjMEc4kE/NS0v9FAUVQ+n5N59QjFOd5
         Xj8A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786443790; x=1787048590; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cysfXdPj+YdmREOFo3GGT4v0uNQet+l8KAd/YoYPd8c=;
        b=gq1rBgfcwyo925+sXPfAcYmFpF3CZJRkLPPueowGAqssB9CIChBd+RUi0KEHDuNM56
         6SiVmAolG7hNWQjELge3ukHkZM3Ung1LcWqPoMO15p5+oZfYiNyq79VIe+oc2X0skwGZ
         AdAHjf6bnVOq7fcZU07gA173c0qQNgGzENS6ZHEYH1xNZHz+LKAXk9jhoZ1CVi2SjiDZ
         jZObhXkoFhvpdC2K3doe1D9Z2D0RdJuRUSHeBqxssLa/29x6o1tT4ABAmsFPIt5c0OBr
         lgngcDFvlD8R3+L7ISbr6QjhCAzSunh8RhS/R/lpdHWoXU7ppcKgJx6IGdpxvJD+5sZP
         ooJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443790; x=1787048590;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cysfXdPj+YdmREOFo3GGT4v0uNQet+l8KAd/YoYPd8c=;
        b=K22mJBU6d871el8mUlqWgTMp9b97UQVMyYu0qBq5I23XLYe1MObOklqkQxBaEBF3y5
         lIFRdX+jE5ReQ1ZKKGEeqNMk/znS+GBq2bSi3oXlMNsaHleUVU7rlh8caOX+DqXO2hpM
         Ymcme2f6WPhAqQfLi0hYTom5N6RkZlxVSacxJUIytq6/evgfE9Ei0M62TAAJigAB/SL1
         tMRhrnGEIWtsSDP2Xi3Qs7afflzauaboKLKR/iATNxrRy/TFbWJk5uQU38HXB1a+HhST
         13fdLtkRJmwPaLuYHMFm6gaLRrjgvy1/LKtStEp0uABcC4AIrUmCAf2pPuk8nkcNhyHb
         eHHA==
X-Gm-Message-State: AOJu0YzkqZBhJcd4vOPGFF8jfycKT3Yxn8E+fZ2+xxw8jnpzvnrKbNmp
	Zd1FspYoZwH/p4zP4Zo8Ob2C4rzahU7uyYIYJcqmyk6hkSYh4HflT8xPazfDlch0f73XbFBHjme
	rpaHlnd7CvHcbWelgCzLkHoEJQShfNvU=
X-Gm-Gg: AR+sD11BVUnuXVz25d9UAGefbbgnKKTosdjXOrukLOYVGL2WT3Jp8mkpxRk+sBvuPyt
	+Gvt/jxHQCqov4mLSvZdbtRL+nLrh8kbXMUkS86ONwkeoi7aQRSa2yDRvTPiJGjdAgVLmdCbzL4
	IWPU8Do5vpRhAavTgUqetTe5fQosCWVa/+8kdI7XJe977T7jV9Oy8A9wv12MtpK1bkg6GXMm2mn
	6UKgp4RnzXY8TYtrWAtxTWcTkv1gsuck2vpqFx4B2Z8Hy9MWfDCp9bySERdLlzRtzm13COKvH1W
	zO6u+5zP4pqFNIjMDrHC53jDdxEMVx0RpwFRWzlNhoL9dDrRia4OvukIKEuF6byXp4TDoRAjP/s
	PgH4=
X-Received: by 2002:a05:6214:5097:b0:8ef:5103:df9e with SMTP id
 6a1803df08f44-90a669480f8mr13404596d6.8.1786443790601; Tue, 11 Aug 2026
 03:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com> <20260811-bitbake-setup-pip-v1-1-0c8b350017e4@bootlin.com>
In-Reply-To: <20260811-bitbake-setup-pip-v1-1-0c8b350017e4@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Aug 2026 12:22:58 +0200
X-Gm-Features: AUfX_myRccpCd4zjz2Pw6URa55nTlnJ29qRF8reu7rNO4PmBY-xSADhkQKNggEE
Message-ID: <CANNYZj9U1oy3CEAqgPtaOMtB+GPER8B3_Y7XNZyo21BPgAA+_g@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] brief-yoctoprojectqs/index.rst: use pip to
 install bitbake-setup
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 10:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10261

On Tue, 11 Aug 2026 at 11:56, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> -   $ git clone https://git.openembedded.org/bitbake
> +   $ python3 -m venv --clear ./bitbake-setup-venv
> +   $ . ./bitbake-setup-venv/bin/activate
> +   $ pip install bitbake-setup

It would be good to also mention how to update to latest release if
bitbake-setup is already installed (bitbake-setup will evolve with new
features and there may be failures due to outdated installations from
pip):

$ pip install -U bitbake-setup
(pip does not have a separate command for package updates
unfortunately, so it's not intuitive).

> +   The ``bitbake-setup`` tool can also be used from the :term:`BitBake`
> +   repository directly:

... is developed and maintained in :term:`BitBake` repository, and so
can be used directly from there:

> +      $ git clone https://git.openembedded.org/bitbake ./bitbake
> +      $ ./bitbake/bin/bitbake-setup ...

The bitbake-setup chapter in bitbake manual needs similar fixes I think?

Alex

