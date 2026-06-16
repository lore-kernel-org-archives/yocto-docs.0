Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BE7CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:47:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156345.1781621260105625149
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 07:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AMs64len;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1EBB84E42F1D;
	Tue, 16 Jun 2026 14:47:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7912601A9;
	Tue, 16 Jun 2026 14:47:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01239106C9DA7;
	Tue, 16 Jun 2026 16:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781621257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g4L4bDREu5iv3PxHQ7aZ66foS6sZCpBoY4eFzv8AGxI=;
	b=AMs64len//j+TQS1DSTk0sr0P1Sg+7eKdSHdnhip7N63grhSguK4qE2sfpBkIbWuj6MZV+
	lWdTIQJa2gMI7CtCVlIyGK+g40SGkSj0RC+cJC+N7CmcjxcN7jHU4CUELbTYTEb656b7yC
	EKXlMtzBp0dsemtJB30l/CJsgPClhivXOuxgs4lNbFh4Njq9wAkN+CSrFpUuBGg36VJEEs
	+/71DY1VKN5216tZ9hB2+zOtUq+mzjoylraeCJ2QagwKX5DyMlBlMJL+IiOub7i81d5uy9
	0BTDfedOGotJqKYIBC9ChI52KvsetzLem5lNuxRVoe7Eahu8IUojFChBTD3lDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 16:47:32 +0200
Message-Id: <DJAK0WH0NS23.251BHRSNA3GIJ@bootlin.com>
Subject: Re: [docs][PATCH V2 3/3] ref-manual/release-process.rst: add patch
 acceptance policies and stable point release upgrades
Cc: <alex.kanavin@gmail.com>, <paul@pbarker.dev>,
 <Randy.MacLeod@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Qi.Chen@windriver.com>, <docs@lists.yoctoproject.org>
References: <20260616052012.3286114-1-Qi.Chen@windriver.com>
 <20260616052012.3286114-3-Qi.Chen@windriver.com>
In-Reply-To: <20260616052012.3286114-3-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 14:47:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9748

Hi,

On Tue Jun 16, 2026 at 7:20 AM CEST, Chen Qi via lists.yoctoproject.org wro=
te:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Document patch acceptance policies and stable point release upgrades,
> including criteria for qualifying upstreams and how stable release
> regexes constrain version checks.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  documentation/ref-manual/release-process.rst | 114 +++++++++++++++++++
>  1 file changed, 114 insertions(+)
>
> diff --git a/documentation/ref-manual/release-process.rst b/documentation=
/ref-manual/release-process.rst
> index a55187c14..fa712869a 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -127,6 +127,120 @@ stable release.
>     exception to this policy occurs when there is a strong reason such as
>     the fix happens to also be the preferred upstream approach.
> =20
> +.. _ref-stable-lts-patch-acceptance-policies:
> +
> +Stable/LTS Patch Acceptance Policies
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +All changes must have already been accepted into the current master rele=
ase
> +and any other release still within its stable support window.
> +
> +**Acceptable:**
> +
> +-  Security and CVE fixes
> +-  Fixes for bugs
> +-  Version updates which follow an upstream stable series or LTS that al=
igns with
> +   the original release (based on compatibility). See
> +   :ref:`ref-manual/release-process:stable point release upgrades` for d=
etails.
> +
> +.. note::
> +
> +   Once :term:`UPSTREAM_STABLE_RELEASE_REGEX` has been accepted for a re=
cipe,
> +   version upgrades matching the accepted pattern are considered accepta=
ble
> +   by default (with the usual ability to reject if upstream fails to fol=
low
> +   their own stable guidelines).
> +
> +**Potentially acceptable:**
> +
> +-  Fixes so the codebase works with newly released distros

I'm not sure I understand this. Could you expand this with an example?

> +
> +**Unacceptable:**
> +
> +-  General version upgrades
> +-  New features
> +-  ABI/API breakage
> +-  Metadata improvements and refactoring, unless this is a dependency of=
 a
> +   required fix
> +

Should we also mention that some backports / patches can be exceptions to t=
hese
rules if it is approved by the TSC?

> +.. _ref-stable-point-release-upgrades:
> +
> +Stable Point Release Upgrades
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Some upstream projects maintain stable branches that only collect bug fi=
xes
> +and security patches =E2=80=94 similar to the Yocto Project's own stable=
 release

s/=E2=80=94/---/

Did you use an LLM to work on these patches? If so, please mention it with =
the
AI-Generated patch trailer as per our policy:
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#accepta=
nce-of-ai-generated-code

> +policy. For recipes tracking such upstreams, it is possible to perform
> +*stable point release upgrades* (e.g. upgrading from 1.0.2 to 1.0.3) rat=
her
> +than only accepting backported patches. This is the mechanism behind the
> +"acceptable: version updates which follow an upstream stable series" pol=
icy above.
> +
> +Criteria for Qualifying Upstreams
> +---------------------------------
> +
> +Setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` for a recipe means that ce=
rtain
> +version upgrades can be confidently treated as stable point upgrades und=
er
> +OpenEmbedded's criteria. The Automated Upgrade Helper (AUH) will then

Link to AUH maybe:

s/The Automated Upgrade Helper (AUH)/The :ref:`Automated Upgrade Helper (AU=
H) <dev-manual/upgrading-recipes.:Using the Auto Upgrade Helper (AUH)>`/

> +automatically send patches to upgrade recipes with this variable set dur=
ing
> +stable releases.
> +
> +.. note::
> +
> +   Patches to upgrade recipes without this variable may still be submitt=
ed
> +   for stable branches, but the barrier for acceptance is high. The comm=
it
> +   message needs to justify that the version upgrade follows our stable
> +   branch policy or that there is an exceptional reason for taking the
> +   upgrade.
> +
> +A recipe may have :term:`UPSTREAM_STABLE_RELEASE_REGEX` set based on the
> +following criteria:
> +
> +1. **Upstream stable branches exist** --- the upstream project maintains
> +   branches named with a stable version component, and there is evidence
> +   that these branches only collect bug-fix and security-fix changes
> +   (no new features or ABI/API breakage). For example, util-linux versio=
n
> +   ``2.41.3`` has three parts in its version and upstream has branches l=
ike
> +   ``stable/v2.41`` with two parts. This demonstrates that bumps in the
> +   third part (e.g. ``2.41.3`` to ``2.41.4``) are stable point releases.
> +   Similarly, systemd maintains ``stable/v259-stable``.
> +
> +2. **Upstream maintainer confirmation** --- the upstream project's maint=
ainer
> +   explicitly confirms that a bump in a certain part of the version is
> +   bug-fix only.
> +
> +3. **Clear historical or common-sense evidence** --- the project's chang=
e
> +   history clearly shows that a certain class of version bump is bug-fix
> +   only, or it is widely understood convention. For example, openssh's
> +   ``p`` suffix increments (``10.2p1`` to ``10.2p2``) and kmod's patch-l=
evel
> +   bumps are historically bug-fix only releases.
> +
> +.. note::
> +
> +   Patches to set :term:`UPSTREAM_STABLE_RELEASE_REGEX` are sent against=
 the
> +   master branch first and follow the normal review process. Once accept=
ed on
> +   master they may be backported to stable release branches. Exceptions =
may be
> +   made when necessary, e.g. setting :term:`UPSTREAM_STABLE_RELEASE_REGE=
X` on
> +   a stable branch for a recipe which has since been removed on master.
> +
> +How Stable Release Regexes Work
> +-------------------------------
> +
> +The stable point upgrade mechanism uses a *filter regex* to constrain th=
e
> +upstream version check so that only versions within the same stable seri=
es
> +are considered. When a recipe sets :term:`UPSTREAM_STABLE_RELEASE_REGEX`=
, the
> +version-checking infrastructure in BitBake's fetchers (git, wget, crate)
> +applies that regex to filter discovered upstream versions. Only versions
> +matching the regex are considered as upgrade candidates.
> +
> +For example, if a recipe is currently at version ``1.4.2`` and the regex=
 is
> +``^1\.4(\.\d+)*$``, then version ``1.4.7`` would be a valid upgrade cand=
idate
> +but ``1.5.0`` would not.
> +
> +For recipes whose version uses a dot-separated scheme, the
> +:ref:`ref-classes-upstream-stable-release-point` class can automatically
> +generate this regex. For other versioning schemes, set
> +:term:`UPSTREAM_STABLE_RELEASE_REGEX` directly in the recipe.
> +
> +

Extra newline not needed here.

>  .. _ref-long-term-support-releases:
> =20
>  Long Term Support Releases


Antonin

