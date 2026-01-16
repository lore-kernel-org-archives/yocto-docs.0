Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CACC982EE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:23:36 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3872.1768587816339234809
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 10:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJx1juVT;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a288811a4so23715356d6.3
        for <docs@lists.yoctoproject.org>; Fri, 16 Jan 2026 10:23:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768587815; cv=none;
        d=google.com; s=arc-20240605;
        b=APf9OWJh8XYs4qKEfpU6uz4g0UpXrBBRKRjJK0h5KXqDeV0zWlorsJcCjM4zYkpahg
         9PBpYXGCrFkIo2ktXCM8NuWVZsnHsc+x73wNGClfJqVKmdE2zI4A3d+Z4m7/PecCwgme
         oj9tCWyoFqPOse38SLTwbovZl/JdHbpzJzV+OK4c2OA4lTMn2NEf/vqmBBpGXQiGLLWX
         N3iryCHZZ5Cjc08kZoSC0u2p0zFotAVvlipiSReBP3Y5sIV33QRXFQUrwqPyL5LV97Nz
         pYf5Rvur7OAUGVJe0A4+76ATBgk6tTGM/tpa/9eUR/xMoKivd57yZQqZy2AXHeKZ/UG2
         bjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZmozKIMcZ6woPCG6Gog7/sAXAP6BVus9NNbaUcw11E=;
        fh=NGLseBuqmfa1iqFS7ahPb3MxnsxQ10L9O3edn/VMCU8=;
        b=HQ5+FKShVhfYp9Kd61p6w2o84/t/5EDphBC8mayGoPg2btwRXhjOcGgsQNayk40GL4
         OfIUVtPO6gHwvr1H3r5henRGNJHg2wxQCjhkzyW5ab3GQVxxXD9oPgmq99CdqZXAc2hw
         UNRDVjYr6R4SlwC6VyDK75Az07IFdyozbHC6PBeaZC4Wqepl3IQ7aKlzqboQATyBdzMX
         Ix64rfxlPiVrMM1z2QVKkVyxfGWm3dkn2C2697Qp5TGEop+DGwWgxpyDgL9fGhA5CDgL
         rAebyXY4sLp+AtyFOGk3sRN0xDsbQh3z1wgqqskatmbE90uSkkNxq+MNBnP/NgocqZRS
         sbbw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768587815; x=1769192615; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZmozKIMcZ6woPCG6Gog7/sAXAP6BVus9NNbaUcw11E=;
        b=aJx1juVTIuByo7E3DaG2e8De5cQuIL6mDr+b4lxqk04tJLoGyf+ZG/urL9k2Qz1VQK
         /kAtkTZflBq34zxK1Ma2FLED1+JjUjztyN5y2ObEyrnPIeoiJGnL7x924Y3eFQel+3Pp
         eMdDyDPuN/Adu/AbyiNsw9rCMTtmHzCRRa7dMGH70iT/Z09riUf8wqB54dR+/ZNV4lGg
         Oyc6AxD6Lg9vvjVoEs3Suj8k+RAWwt1DmZ/1ptuNam1UrjWUgTAOX/yaWKLXMnks0WsC
         AZAA20YxbI6+kXzv3iNX5nGcQ0Uso78C06zDxeVInS7pBId5xukjNsh7Tcm0am7dL5gR
         4BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768587815; x=1769192615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZmozKIMcZ6woPCG6Gog7/sAXAP6BVus9NNbaUcw11E=;
        b=C2UG3fGe/P30HbIBirL/WDRUjHAHIxffkWmBPoQX1S0Up1UkpSzEWrUw/L/7evwWXG
         q40grDaYKHeReueULG6DWRt6ZVez4+jaqhPucabGT6U2FGccbcanJoe3zvryIJivUza/
         SaJ1X0hNQdK6XcF0s7TYln1izqAQJxwOV5Z36R2oh6MAmIXDn1RQBvMdcYDjBliGdYPj
         jU1mQV79sYgIfNEzpqJitqFArQiEtKSbVwt3xuJFJjdKKQZfZAGb0pmG1my5MuynyEPc
         PgwHW/P5l91KqycjsIlSpjqPfh4l9EuUgwL7+GzzpdIRi4OLR4nS9QILdlUqGF1ylDgs
         k7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXyiJ7DsNwIoOLxtFJpU1XnimJszi7QhF4vrjWLZrFLtRU2K/r+ah9X1/3K0Bi7rezO0zzZ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy3kg94UyosXNaZdGqZvnifpduoPO4A1UeoiEQ/5xT9Jis+Jdgw
	2/9yOWcfHS3qDVBx3HvVH1+v24EiF8ZxiBt9VNMLr7jPSF+9lnoSExQ7Aet9XL+EoHg798FvHVa
	bVP8/dWQ5/URrHMURXR4HZQjEFe8TiCs=
X-Gm-Gg: AY/fxX6mDjzGcZLZfrHLMOPyyIxa523b8Dh0Kt0IpDIzfdgwF9WfIMN3vJJKsAjM4Sx
	r8XX4y4un+xTVNWpNDTSaQ5o1upldfMCz61JBXU/1ixqB27tnhIlxC51k2V7lvhfnDJLlrm3ez5
	eLNo5Ex2yHr74PstSEwuhjjScvitCQgFIlETHf35t4XHR8RCXz2AtD/cpE0e/mUFlcBS/pp0Og8
	rtnmR4IobxSBAXKD3/B134HDsxMFn7XtCIVtYXjKzbli3iw8BfMBvIhbuyZ/wtr4RobijkdTVvM
	NIk=
X-Received: by 2002:ad4:574e:0:b0:88f:a4ff:454e with SMTP id
 6a1803df08f44-8942dbf126dmr56609396d6.10.1768587815333; Fri, 16 Jan 2026
 10:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20260116-bitbake-setup-choose-builtin-v1-0-8d66666a9efd@bootlin.com>
 <20260116-bitbake-setup-choose-builtin-v1-1-8d66666a9efd@bootlin.com>
In-Reply-To: <20260116-bitbake-setup-choose-builtin-v1-1-8d66666a9efd@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Jan 2026 19:23:24 +0100
X-Gm-Features: AZwV_Qi7jqFMn7lqYWdJMZ5JIvEe3BU7kudNh3FKrhvOR4W-t8h2CQfTzrFxl2s
Message-ID: <CANNYZj-Oh-WWLEhX=ZKpB2ddrR=oYseXBBgT-zQQ0CPUdA+HBg@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] bin/bitbake-setup: add descriptions for
 fragment choices
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Jan 2026 18:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8584

On Fri, 16 Jan 2026 at 16:49, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> -                        "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64", "machine/genericarm64", "machine/genericx86-64"]
> +                        "options" : {
> +                            "machine/qemux86-64": "Machine configuration for running an x86-64 system on QEMU",
> +                            "machine/qemuarm64": "Machine configuration for running an ARMv8 system on QEMU",
> +                            "machine/qemuriscv64": "Machine configuration for running an RISC-V system on QEMU",
> +                            "machine/genericarm64": "Machine configuration for Arm64 SystemReady IR/ES platforms",
> +                            "machine/genericx86-64": "Machine configuration for generic x86_64 (64-bit) PCs and servers"

Let's make this properly extensible:

options: [ {"name":"machine/qemux86-64","description":"Machine
configuration for ..."}, {"name":...},...]

Basically "options" remains a list, but each item in that list can be
either a string, or a dictionary. That way more keys can be added to
the dictionary in the future if needed.

Alex

