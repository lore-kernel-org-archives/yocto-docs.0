Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40326C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 12:51:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.10698.1642423879789265564
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mw1/Xlij;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so24095487wmo.5
        for <docs@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=48DVYNGnaeU7Sk9SLsre7u8vIc4ddMwTNDHqCiycVxs=;
        b=Mw1/XlijOKN2DyMZGvuMYbKuk52wJAgeS1MJWYhd5Yo9PD+9VQt8EnRIeuBlMSLvbh
         YgbQKBunPRqzdg9mNdK47t47gkX6fGDzC5UsuF9bFp2cbVmigTtSumUovjLJ1p74PGqH
         qm4lImNg3NOLDzIRfRII811+XIGZ8mNQeBcHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=48DVYNGnaeU7Sk9SLsre7u8vIc4ddMwTNDHqCiycVxs=;
        b=tPTVXV8uvgozsazkmUVO0EAcSz8iFu41ayEHkaBg/Wca8Pf4IIPl3ezjYj1Cij6s/T
         ahJEa0JXaxZ4t/zcEvGi5JpxKWDs51QWmXa7q7MnutI6aJXmW4+zuSFEy/A4M1rCxK/h
         W8HoQPiTFtRdJBqjMruQusYdZuqzuTyaBdvg5pFTvXL4ASf8SUH+RHSU2FLC26snrR9z
         VOKl5a01zjwdnB54n/yw2eggD33n5NoHt5YD+eNG4UQ0CEaqCNj5aIDfHrv6Krk1IHt6
         soOBJYdVadV4N0/EOeriHr2CSBKR2TS8cVQCiF8fZx8TSlb0VEthfbZbEyt6UtRKcdBM
         2NFw==
X-Gm-Message-State: AOAM531zdVLG1Gw0tbz3ixEHpZxSNhlX/0PxSb31aCUskhqGeJakuzIH
	QmKcJor0eXXJHffKVnDergHo8A==
X-Google-Smtp-Source: 
 ABdhPJz7kvigP1mctu8dBwdjG7Sp3WBgiOs7cpO689NcqD2JJfVDJK58XRVnro3b7vMNor0wESUOFA==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr19331035wru.51.1642423877846;
        Mon, 17 Jan 2022 04:51:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36?
 ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 k10sm13606638wrz.113.2022.01.17.04.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 04:51:17 -0800 (PST)
Message-ID: 
 <37ea9c19f9c8d8810ae2b2404c0994b735b4130d.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] migration-guides: prepare for release 3.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Mon, 17 Jan 2022 12:51:16 +0000
In-Reply-To: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
References: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Jan 2022 12:51:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2414

On Fri, 2021-12-17 at 15:04 +0100, Michael Opdenacker wrote:
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
> new file mode 100644
> index 0000000000..c63c9dff05
> --- /dev/null
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -0,0 +1,37 @@
> +Release 3.5 (kirkstone)
> +=======================
> +
> +This section provides migration information for moving to the Yocto
> +Project 3.5 Release (codename "kirkstone") from the prior release.
> +
> +Recipe changes
> +--------------
> +
> +- Because of the uncertainty in future default branch names in git repositories,
> +  it is now required to add a branch name to all URLs described
> +  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
> +
> +     SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> +
> +  A :oe_git:`convert-srcuri </openembedded-core/tree/scripts/contrib/convert-srcuri.py>`
> +  script to convert your recipes is available in :term:`OpenEmbedded-Core (OE-Core)`
> +  and in :term:`Poky`.
> +
> +- Because of `GitHub dropping support for the git:
> +  protocol <https://github.blog/2021-09-01-improving-git-protocol-security-github/>`,
> +  recipes now need to use ``;protocol=https`` at the end of GitHub
> +  URLs. The same script as above can be used to convert the recipes.
> +
> +- The :term:`TOPDIR` variable and the current working directory are no longer modified
> +  when parsing recipes. Any code depending on that behaviour will no longer worked as
> +  expected (we don't know of any).
> +
> +- BitBake no longer supports ``append``, ``prepend`` and ``remove`` operators
> +  combined with the ``+=``, ``=+``, ``.=``, ``=.`` and ``?=`` operators.
> +  Such operations should be made using ``=`` alone. This means that
> +  a leading space may need to be explicitly added.
> +
> +- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
> +  which use ``PKG:xxx`` renaming such as :ref:`debian.bbclass <ref-classes-debian>`.
> +  Doing this will produce an error.
> +

Thanks for starting this. We need to now add something like:

"""
Network access from tasks is now disabled by default on kernels which support
this (most recent distros e.g. centos8 and debian11 onwards). This means that
tasks accessing the network need to be marked as such with the network flag,
e.g.:

do_mytask[network] = "1"

This is allowed by default from do_fetch but not from any of our other standard
tasks. Recipes shouldn't be accessing the network outside of do_fetch as it that
usually undermines fetcher source mirroring, image manifests and licence
manifests/auditing.
"""

Cheers,

Richard






