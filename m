Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C02C531D4
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:25:02 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24708.1784816694270981686
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 07:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MG2Vpd8a;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2cce930cso6567461cf.0
        for <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 07:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784816693; cv=none;
        d=google.com; s=arc-20260327;
        b=LKvOSSkgk/7f03aQdYY2xfhZTh0p6QSEbqeajxuQWvaV633Kv6b7oTCKPKxVWjA7Ja
         GNWemmOWS2EuGhWCPJF6TUnumpB9I6e9JZ8075r5nlX8Jj44wnFV57n5c80iqbgF2MLY
         BRPMUff5tmqtGbBKIHW9lk+bHFOAu0cdpyVVUEtqZhBSlf3kB+I8hwIBVYo5Qm8AlPMk
         CgjyBKSDkjP/1x/aXmqVKbIApX7YDWVb1fRHAt34B7BQgmNAtT6XfFThh/FiECSeyxNG
         ropx+xUP/ufiosxbjrt6f/L1RyFVoVI1GvGsUcZSoqr6XsSseduDGZjOpHWkML9IkXM/
         ATKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q3PvskUTlNnVXm9fZeaP811IW+Fj794+4Y2/VGhixLw=;
        fh=il78ns/8ycm6Soinj6mftE4KJyXTklqnlCSvqyKT52k=;
        b=n2S4HSUwD+EiZnlFd/HVokK268qLkJH5RVGyYNunEUcXlSA+M6/fQxzERnUK5L2WnF
         TwUh2skBmZbeOsjdNJAL2JBL9Omj/JZG2oZSZyaLex+JrqDazMhSVVNaxmW/wMIQxiGp
         lVAr7EU80BhxpLcXHYos/qaO+CH4/rtJL1JP4dfm1I1ZVXQhKPBYuLehCVPjvHkMxzZG
         o4CotGyRT4azIcM0fgXahub7T4P5cv15MJzIcv2TNpKbz99G95ZTu3zWahuzEaUZCqES
         mDTnDtmDjDgjXRdF8iSHCABxKOXEMqT3vn+0RsR+BQX5zK19WLa96wHAxTSj3vDo8Kh6
         XFsw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784816693; x=1785421493; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3PvskUTlNnVXm9fZeaP811IW+Fj794+4Y2/VGhixLw=;
        b=MG2Vpd8akpnt5hsZxEQOXGDAnTc10NZWbTF/WCM35wvvdPcOrG/A+O+TurSn9yFvYZ
         HrAyrEb9S20uN3FXX5DyJfi5bOTuYmz3xO9pcNfVsQHj2lGrqvZ/TX6Ae+lUH3ivww1T
         OZJBf1m0RlrMd8w06b0OBkOEMkntLNaMVZnLmq2biaL6HzTzYIz8pbyNWZJRp+6rf9z+
         F7uU+iuDtyl+MO0S4n7nVRp0q3WiJCfOTFbJvVpbLuQvH0vM1eQYsNYFgl44UYjk3OEm
         XLAr0WtvmgFJezxnCyhFESVqk4KGpewfsDbLJH8NSxQ6kQjs7YUaAvasb4lHjpT4X+05
         03XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784816693; x=1785421493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q3PvskUTlNnVXm9fZeaP811IW+Fj794+4Y2/VGhixLw=;
        b=kJC1tInN4+zNBvBfntv4vi6niL317UYV3DzjCy3D51ZVtY8dtUgaWei3ndlxW84XLC
         E1Nkdub9UtZAR4Je59ApOFQnovjU+yxAxGhLb/gWhLGRnSIEGnOkzEAMGjMLUzljv+hP
         SuDULHmkfN47rX+g+1j/TBHZGry3QX96XaW8QzTx+GTNxxWHZIUAdVlInQqBJ/cloC67
         hGJJRjPPQcpwku9Zeu+o6HvIWm0fmQ2Hj9uUOywg8K0sUM97jURP5hGSBxENanAmXd37
         EE7JsVn6vNRUIyweLLIC+UzO1laeKWBKIEEYphBEj7mtbmmtd057u05hLkOEiRnH9yU8
         Ltxg==
X-Forwarded-Encrypted: i=1; AHgh+RpHbTAZUrGM9aa4lejvPvseCJW8/n+iX2umjzfuIHO3KqyWEKhoORu2fH3b+qG8MePZmjKM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwLbxlpBw3u8v/c++bMBHDIhVNsvUFNMiyVeIudHPEkothakf23
	5Xa07JFbKPgt/l7u+G+8emcqedHPpLlHFKbYGhHNUhl9jJ5k4iCIoaySMXw2Vc7oPfyveJi4fy2
	Z7+vfBz0BoQGDBEmjObbGUAQ/VBM8TFI=
X-Gm-Gg: AR+sD11Sm5FBKDfvLp3r8N4vKGE+vgSmaD1kZG1wT4jWUjO+RpgfGXjdWiEFcQrh9xa
	+mPF5K6zE5qY/kCVv6hfGUNkpYqkb/pNNemtOZmeto9RbnlDWUm2OpklOoIUIO205RhZg7Y7CiZ
	ecyFPaYF6lVErWSbyOaBhoSoxj8lFi6aSmu+ZXcuMr6ObldNYvU+y+kxmmZq0lx7+WvY6kVGeHL
	Rfgh/ZPjJe98IxU1D1nj+gLATfzdmQAo6GffuUNZ5GOzgxSbP1zPavzo/yBDv4M9nhcZP1aM6Gk
	pH1xA+6yqkxAH2O+VsUm
X-Received: by 2002:ac8:7f83:0:b0:51b:fe3c:6c1 with SMTP id
 d75a77b69052e-5283de557c1mr31584861cf.27.1784816692933; Thu, 23 Jul 2026
 07:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260617064116.2672321-1-Qi.Chen@windriver.com>
 <20260617064116.2672321-3-Qi.Chen@windriver.com> <32c35bd7cc547bd2228323fea58a2c84c88476c7.camel@ericsson.com>
In-Reply-To: <32c35bd7cc547bd2228323fea58a2c84c88476c7.camel@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jul 2026 16:24:41 +0200
X-Gm-Features: AUfX_mxrIO4kga81lU4tje3WHHITMt63OHyWoCCyvfhDdDOLa9N3UhCZvpEQy8I
Message-ID: <CANNYZj_Zxr9o5J11L0Bmm472Q+VXppQ7oNgft0RZr-5_nXdnQg@mail.gmail.com>
Subject: Re: [docs][PATCH V3 3/3] ref-manual/release-process.rst: add patch
 acceptance policies and stable point release upgrades
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, "paul@pbarker.dev" <paul@pbarker.dev>, 
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>, 
	"Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 14:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10121

On Thu, 23 Jul 2026 at 15:43, Daniel Turull <daniel.turull@ericsson.com> wrote:
> We discussed in the Yocto meeting that I will take over the work here. The patch has been already
> merged into docs master, but I have a comment regarding Upstream maintainer confirmation.
>
> Shouldn't be enough with "Upstream stable branches exist" and "Clear historical or common-sense
> evidence"?

To me it the sensible criteria would look like:
upstream stable branches exist AND (upstream maintainer confirmation
OR clear historical/common-sense evidence)

Alex

