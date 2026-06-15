Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73081CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:01:47 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125587.1781514104725582865
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 02:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=RMnYLICX;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=NuK2N+TO;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A8E217A00C4;
	Mon, 15 Jun 2026 05:01:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 15 Jun 2026 05:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781514103; x=1781600503; bh=nA8M14PuGT
	IlZl23RS7lywASRp7WEnxduHfGnfUyqfI=; b=RMnYLICXjCDjAWGpTXopo4K7EG
	uDfQeju/vUwlZ7zrpklOd0yU20kYEFq7biAd0IXAuTWmAjYiDt7HVLinqkUMiWQo
	KOkBtHf5dEMVrVvCSJLoa+IVuPxi+Ye9IAsRSYlbyE+QVZJslK4P7Iddk3uhuCdw
	PqF31HxLRfglZ7clh+XNPlTw+MlRVWLF73uqoLl/tMXiP52UPskGKNa+bMC2v6iO
	uLM1We7owvyIAefEupacrG8B+32KLelgXvfsPzqVDkZIk8bwkHMoQIa1RAo8+43o
	5d83F6pCDMIddu5a8kgTYq8zlWA85OMo7e6+Yz01oY77c80OkwCkdT5bP7bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781514103; x=1781600503; bh=nA8M14PuGTIlZl23RS7lywASRp7WEnxduHf
	GnfUyqfI=; b=NuK2N+TOqv00mOPvU0fKKDQ8FZfw0RbqQSIgP1izuEHI4DYpTys
	y97b42IGS8C/qcLfLD0X1+RUu3hVGXe/8hbnxx2SiX42n9I6Y1AgicfRj8aPY0+S
	hntbca0mL27aULovrmvXy/6atC7Zk3PqrsmWOEug5nBXTH8MnCKxmYC1LWCes8Fe
	YmMFI5BN23PaNYwSgeHn98Ma0yzi0895LcDrnmwBO6cUWzrOyuT+vu+YfIw1sZce
	krJ/Sz4ZFzB1AvG5BeXJ8QzDleEyC6VQSSUIzVdXnnsPZrVX4KBfZWAeiQl5NhJV
	uzlmwi2pwMlgfx0zw2sa45XsJkEC7GF8iVQ==
X-ME-Sender: <xms:d78vau7VmO1KBYvs9QiKXbQJBQ92G5r7L28rqSwLmi4nedEDAzUz5Q>
    <xme:d78vavXhgMfwwcqDzAeCZ-xnDX8DZ6IoRgpnE0bSYpjFx2iHjpJPKUMHAmpyKw7Dr
    tmgTQQTT9NkxSNeyg39r5kARSqcKUM_q6i8J0SW6YzQ87nj5w2O_Pk>
X-ME-Received: <xmr:d78vaq1bPLW0pFCIiGqCklyuf_VEyJ451rEf8heTi2Nt_5a-qav0WIU2UxoVL4IABpUOG-ULrdyebAe4hkmYG3ZIJ0J723nmPo8Oi89QKfcb>
X-ME-Proxy-Cause: dmFkZTGGkpB0G+IUKCZulAED/3IeKfZvs5Tj8aTK23yTxhbgWnZBQnpFNkY2rogA91kQFd
    47zMtccHIjU/c8zxj0zVRI4YnTq48E3bPmBCqMBDW3Oxir/w0Wj0Ql19ZK82KRak3iczI1
    uJY27VRsY91twhXPb4616D3dCj97/6QiCpUwOYIXLZl/j4ueKxrTaYykjvEvdrwgd6x4T/
    M/QI9VeeJ0u5Zx0gsdm8Xx+M/nYjpi45w8qGvKHN1i9JObjqA9tZ8XrZNkIxpEvR3HmiRK
    xB3NKZV9BEUpq5IPHDrJD2OHJbTsTjclzXKCNzEnxNI9VP+9aBxg8W7NyHDy158TubMJkr
    dGc/oYlSRynjuXekxvsDn90F7ITFaZlaSmODOq+qO4uPEL5vlJ0hPKED7mT1IVheIAI3Zy
    Ys4ueIXvTCe/7oazFBdZRnRS1V+kln3wywnsPUlEYH+vzPCECQi/0Rru34Y23+5CNdN8+j
    Slgp36T7ogH7lUuGZbcbbezv3hI7fsuI6od2c0DoBNvb/4SYhnwbjG6IUqlQiSNhKF0ufY
    RkFwZn6BBCReiinEsf+eEDigT0OiR3JZGBfWRNwTCBXvJYf/v57yG4srW9G3RE/yPhpRDq
    hlvP0BPHM9CjKruBJQuSxPXKci7sI4Of4gX5kcvA4NfQY4WtlLFR5P0Q7glQ
X-ME-Proxy: <xmx:d78vak36VtfVpVTQ7o-mBziJj9TcU0x94KnWdWTaVU3njyhwt9Q9BA>
    <xmx:d78val88R8Q6p-QZ61przuiZ5baAsuYDb2ThvyTc-8hBkAPAyjLaoA>
    <xmx:d78vap2Pt6ZER48gBkNGqT4bQ59eS3pss4Bt0HTsO-WYjI6x3tyEbw>
    <xmx:d78vaq89vt9jxx4WceM0JJpW9_Vd2T0tVg-e--d8f6r0qbRH_jCvbQ>
    <xmx:d78vah-3g6Ax5zahk2J3La2U5Sf66H0HcZpkLF1fjvfO7bkr7delUuGi>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jun 2026 05:01:42 -0400 (EDT)
Message-ID: <4e8b09c919f3d94280c6e5e1ea8e0c0342a1959c.camel@pbarker.dev>
Subject: Re: [docs] [PATCH 3/3] ref-manual/release-process.rst: add patch
 acceptance policies and stable point release upgrades
From: Paul Barker <paul@pbarker.dev>
To: Qi.Chen@windriver.com, docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com
Date: Mon, 15 Jun 2026 10:01:38 +0100
In-Reply-To: <20260615062438.3119651-3-Qi.Chen@windriver.com>
References: <20260615062438.3119651-1-Qi.Chen@windriver.com>
	 <20260615062438.3119651-3-Qi.Chen@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-J4sytfYeWIclc+DUm0FG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 09:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9717


--=-J4sytfYeWIclc+DUm0FG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-06-14 at 23:24 -0700, Chen Qi via lists.yoctoproject.org
wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Move the Stable/LTS Patch Acceptance Policies from the wiki into the
> reference manual. Expand the 'potentially acceptable: bug-fix-only
> version upgrades' item with a new section documenting:
> - criteria for qualifying upstreams (stable branches, maintainer
>   confirmation, historical evidence)
> - how stable release regexes work to constrain version checks
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Hi Qi,

Firstly, thank you for sending this! I really appreciate the effort to
help migrate wiki content into the docs.

> ---
>  documentation/ref-manual/release-process.rst | 97 ++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>=20
> diff --git a/documentation/ref-manual/release-process.rst b/documentation=
/ref-manual/release-process.rst
> index a55187c14..3bccbfbdb 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -127,6 +127,103 @@ stable release.
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
> +-  Changes to follow an upstream stable series or LTS that aligns with
> +   the original release (based on compatibility)

I would probably say "Version updates which follow..." instead of
"Changes to follow...". "Changes" sounds a little too broad.

> +
> +**Potentially acceptable:**
> +
> +-  Fixes so the codebase works with newly released distros (only in the
> +   first six months after a given release series first release)

We have actually been accepting updates to support new distros based on
complexity of the patches and risk of regressions, not on the age of the
stable branch. So, I think we can drop the statement in brackets - these
changes are potentially acceptable but subject to maintainer judgement.

> +-  Bug-fix-only version upgrades for upstreams that meet the criteria fo=
r
> +   stable point release tracking (see
> +   :ref:`ref-manual/release-process:stable point release upgrades`)

This duplicates what we have in the acceptable section above. I think
once an UPSTREAM_STABLE_RELEASE_REGEX patch has been backported, version
updates following the accepted pattern should be considered acceptable
by default (with the usual ability to reject if upstream fails to follow
their own stable guidelines).

> +
> +**Unacceptable:**
> +
> +-  General version upgrades
> +-  New features
> +-  ABI/API breakage

I would add "Metadata improvements and refactoring, unless this is a
dependency of a required fix".

> +
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
> +policy. For recipes tracking such upstreams, it is possible to perform
> +*stable point release upgrades* (e.g. upgrading from 1.0.2 to 1.0.3) rat=
her
> +than only accepting backported patches. This is the mechanism behind the
> +"potentially acceptable: bug-fix-only version upgrades" policy above.
> +
> +Criteria for Qualifying Upstreams
> +---------------------------------
> +
> +Setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` for a recipe means that ce=
rtain
> +version upgrades can be confidently treated as stable point upgrades und=
er
> +OpenEmbedded's criteria. The Automated Upgrade Helper (AUH) will then
> +automatically upgrade recipes with this variable set during stable relea=
ses.

The AUH sends patches instead of directly merging changes, so I'd reword
this a little:

"...will then automatically send patches to upgrade recipes..."

> +
> +.. note::
> +
> +   Recipes without this variable can still be upgraded for stable releas=
es
> +   through manual review. They simply will not be picked up automaticall=
y
> +   by AUH.

This makes it sound like such updates are likely to be accepted, which
isn't really true. So, perhaps:

"Patches to upgrade recipes without this variable may still be submitted
for stable branches, but the barrier for acceptance is high. The commit
message needs to justify that the version upgrade follows our stable
branch policy or that there is an exceptional reason for taking the
upgrade."

> +
> +A recipe may have :term:`UPSTREAM_STABLE_RELEASE_REGEX` set if any of th=
e
> +following criteria are met:

I would say "...based on the following criteria:" as there is still
maintainer judgement involved and we may not automatically accept things
that seem to meet the criteria.

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

I think we need to note the process that patches to set
UPSTREAM_STABLE_RELEASE_REGEX are sent against the master branch first
and follow our normal review process. Once accepted on master they may
be backported to stable release branches. Exceptions may be made when
necessary, e.g. setting UPSTREAM_STABLE_RELEASE_REGEX on a stable branch
for a recipe which has since been removed on master.

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
>  .. _ref-long-term-support-releases:

Best regards,

--=20
Paul Barker


--=-J4sytfYeWIclc+DUm0FG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCai+/chEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqRPAQCO/Dw2NpDvNs+hvyYk8VkJNF3IET197TkO
CMWSEiv2MwD/TgrQ9yVdSQxYCeQOlVF47h6XF9s0Yr7Y1TUNDUJeog0=
=8rtN
-----END PGP SIGNATURE-----

--=-J4sytfYeWIclc+DUm0FG--

