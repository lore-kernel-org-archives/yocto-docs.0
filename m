Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65451C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:41:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.22968.1713192087037847568
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 07:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bRe61Nf9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED268240002;
	Mon, 15 Apr 2024 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713192085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofN/kvGecAiDJh5igTLmK9q1h7sbreSJpLmGxvyrxBg=;
	b=bRe61Nf9+VOSJs3NeO4CjE3k8snbn5A35w7TgVUOfDXaXO0M/IpKQ0aDvMyz97Q89KLqhJ
	O+bDZjE0qJdaD/xaHf9u7H+nUKj8ZXTUNTO9DHoznnKl5jY6t1IEeaGH9VFfZ1igDLcF81
	39XvG8Ufjr5jeVQ43WQJnDLwKvkQ5j0ubSBLjfYjxuP64KOBo9Vr5r5pb/X41jyPpEcSWi
	NKM7kRbPO5wBUwjfFfzA7MaM/eQ4BMbupC6OpGQUK3r9V+D+YX/7eJff0zmukqVAwXYGMr
	DUWvBjU6InxuWMdD6Eijca+UxO5Pf3q6EVwSmYB3WBh7lC8hmTVU0AUT344evQ==
Message-ID: <1913f786-d3d1-4700-b705-0622e31f4ce1@bootlin.com>
Date: Mon, 15 Apr 2024 16:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 8/9] migration: Extend migration guide for 5.0
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <72a076d449b48273a557dc3ebe3dde9ea11e70d2.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <72a076d449b48273a557dc3ebe3dde9ea11e70d2.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 14:41:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5155


On 4/14/24 at 22:43, Paul Eggleton wrote:
> +ipk packaging changes
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +ipk packaging (using ``opkg``) now uses ``zstd`` compression instead of ``xz``
> +for better compression and performance. This does mean that .ipk packages
> +built using the 5.0 release requires opkg built with zstd enabled - naturally
> +this is the case in 5.0, but at least by default these packages will not be
> +usable on older systems where opkg does not have zstd enabled at build time.
> +
> +Additionally, the internal dependency solver in opkg is now deprecated - it
> +is still available in this release but will trigger a warning if selected.
> +The default has been the external ``libsolv`` solver for some time, but if you
> +have explicitly removed that from :term:`PACKAGECONFIG` for ``opkg`` to
> +select the internal solver, you should plan to switch to ``libsolv`` in the
> +near future (by including ``libsolv`` your custom :term:`PACKAGECONFIG` value
> +for ``opkg``, or reverting to the default value).
> +

Here I replaced a few instances of "``opkg``" and "opkg" by "Opkg", 
which is the project name.
> +
>   .. _migration-5.0-misc-changes:
>   
>   Miscellaneous changes
>   ~~~~~~~~~~~~~~~~~~~~~
>   
> --  ``bitbake-whatchanged`` script was removed.
> +-  ``bitbake-whatchanged`` script was removed as it was broken and unmaintained.
> +-  ``scripts/sstate-cache-management.sh`` has been replaced by ``scripts/sstate-cache-management.py``, a more performant Python-based version.
> +-  The ``bmap-tools`` recipe has been renamed to ``bmaptool``.
> +-  ``gpgme`` has had Python binding support disabled since upstream does not yet support Python 3.12. (This will be fixed in future once it is fixed upstream.)
> +-  A warning will now be shown if the ``virtual/`` prefix is used in runtime contexts (:term:`RDEPENDS` / :term:`RPROVIDES`) - see :ref:`virtual-slash <qa-check-virtual-slash>` for details.
> +-  ``recipetool`` now prefixes the names of recipes created for Python modules with "python3-".
> +-  The :ref:`ref-classes-cve-check` class no longer produces a warning for remote patches - it only logs a note and does not try to fetch the patch in order to scan it for issues or CVE numbers. However, CVE number references in remote patch file names will now be picked up.
> +-  The values of :term:`PE` and :term:`PR` have been dropped from -f{file,macro,debug}-prefix-map, in order to avoid unnecessary churn in debug symbol paths when the version is bumped. This is unlikely to cause issues, but if you are paying attention to the debug source path (e.g. in recipes that need to manipulate these files during packaging) then you will notice the difference. A new :term:`TARGET_DBGSRC_DIR` variable is provided to make this easier.
>   -  ``ccache`` no longer supports FORTRAN.

I made a few formatting changes to this part, but that's no big deal :)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


