Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B487C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 06:50:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.28684.1641797448894209842
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Jan 2022 22:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1n6oVy-0000IJ-4n; Mon, 10 Jan 2022 07:50:46 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1n6oVx-00Cr7c-Cq; Mon, 10 Jan 2022 07:50:45 +0100
References: <16C812800894D4AC.11018@lists.yoctoproject.org>
 <20220107190840.784216-1-michael.opdenacker@bootlin.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH V3] overview-manual: document hash equivalence
Date: Mon, 10 Jan 2022 07:29:10 +0100
In-reply-to: <20220107190840.784216-1-michael.opdenacker@bootlin.com>
Message-ID: <6rbl0kjd8a.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 06:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2361

Hi Michael,

a good summary of hash equivalence! Perhaps you could add somewhere that
reproducibility is a key ingredient for the stability of the task's
output hash, hence the whole mechanism's efficiency strongly depends on
reproducibility.

Please find some minor fixes further down.

On Fri, Jan 07 2022 at 20:08 +0100, "Michael Opdenacker" <michael.opdenacke=
r@bootlin.com> wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/overview-manual/concepts.rst | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index 6f8a3def69..781ba1b070 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1938,6 +1938,132 @@ another reason why a task-based approach is prefe=
rred over a
>  recipe-based approach, which would have to install the output from every
>  task.
>=20=20
> +Hash Equivalence
> +----------------
> +
> +The above section explained how BitBake skips the execution of tasks
> +which output can already be found in the Shared State cache.

s/which/whose/

> +
> +During a build, it may often be the case that the output / result of a t=
ask might
> +be unchanged despite changes in the task's input values. An example migh=
t be
> +whitespace changes in some input C code. In project terms, this is what =
we define
> +as "equivalence".
> +
> +To keep track of such equivalence, BitBake has to manage three hashes
> +for each task:
> +
> +- The *task hash* explained earlier: computed from the recipe metadata,
> +  the task code and the task hash values from its dependencies.
> +  When changes are made, these task hashes are therefore modified,
> +  causing the task to re-execute. The task hashes of tasks depending on =
this
> +  task are therefore modified too, causing the whole dependency
> +  chain to re-execute.
> +
> +- The *output hash*, a new hash computed from the output of Shared State=
 tasks,
> +  tasks that save their resulting output to a Shared State tarball.
> +  The mapping between the task hash and its output hash is reported
> +  to a new *Hash Equivalence* server. This mapping is stored in a databa=
se
> +  by the server for future reference.
> +
> +- The *unihash*, a new hash, initially set to the task hash for the task.
> +  This is used to track the *unicity* of task output, and we will explain
> +  how its value is maintained.
> +
> +When Hash Equivalence is enabled, BitBake computes the task hash
> +for each task by using the unihash of its dependencies, instead
> +of their task hash.
> +
> +Now, imagine that a Shared State task is modified because of a change in
> +its code or metadata, or because of a change in its dependencies.
> +Since this modifies its task hash, this task will need re-executing.

s/re-executing/re-execution/

> +Its output hash will therefore be computed again.
> +
> +Then, the new mapping between the new task hash and its output hash
> +will be reported to the Hash Equivalence server. The server will
> +let BitBake know whether this output hash is the same as a previously
> +reported output hash, for a different task hash.
> +
> +If the output hash is already known, BitBake will update the task's
> +unihash to match the original task hash that generated that output.
> +Thanks to this, the depending tasks will keep a previously recorded
> +task hash, and BitBake will be able to retrieve their output from
> +the Shared State cache, instead of re-executing them. Similarly, the
> +output of further downstream tasks can also be retrieved from Shared
> +Shate.
> +
> +If the output hash is unknown, a new entry will be created on the Hash
> +Equivalence server, matching the task hash to that output.
> +The depending tasks, still having a new task hash because of the
> +change, will need to re-execute as expected. The change propagates
> +to the depending tasks.
> +
> +To summarize, when Hash Equivalence is enabled, a change in one of the
> +tasks in BitBake's run queue doesn't have to propagate to all the
> +downstream tasks that depend on the output of this task, causing a
> +full rebuild of such tasks, and so on with the next depending tasks.
> +Instead, when the output of this task remains identical to previously
> +recorded output, BitBake can safely retrieve all the downstream
> +task output from the Shared State cache.
> +
> +This applies to multiple scenarios:
> +
> +-  A "trivial" change to a recipe that doesn't impact its generated outp=
ut,
> +   such as whitespace changes, modifications to unused code paths or
> +   in the ordering of variables.
> +
> +-  Shared library updates, for example to fix a security vulnerability.
> +   For sure, the programs using such a library should be rebuilt, but
> +   their new binaries should remain identical. The corresponding tasks s=
hould
> +   have a different output hash because of the change in the hash of the=
ir
> +   library dependency, but thanks to their output being identical, Hash
> +   Equivalence will stop the propagation down the dependency chain.
> +
> +-  Native tool updates. Though the depending tasks should be rebuilt,
> +   it's likely that they will generate the same output and be marked
> +   as equivalent.
> +
> +This mechanism is enabled by default in Poky, and is controlled by three
> +variables:
> +
> +-  :term:`bitbake:BB_HASHSERVE`, specifying a local or remote Hash
> +   Equivalence server to use.
> +
> +-  :term:`BB_HASHSERVE_UPSTREAM`, when ``BB_HASHSERVE =3D "auto"``,
> +   allowing to connect the local server to an upstream one.
> +
> +-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquiv=
Hash``.
> +
> +Therefore, the default configuration in Poky corresponds to the
> +below settings::
> +
> +   BB_HASHSERVE =3D "auto"
> +   BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> +
> +Rather than starting a local server, another possibility is to rely
> +on a Hash Equivalence server on a network, by setting::
> +
> +   BB_HASHSERVE =3D "<HOSTNAME>:<PORT>"
> +
> +.. note::
> +
> +   The shared Hash Equivalence server needs to be maintained together wi=
th the
> +   Share State cache. Otherwise, the server could report Shared State ha=
shes

s/Share State cache/Shared State cache/

Best regards
Ulrich


> +   that only exist on specific clients.
> +
> +   We therefore recommend that one Hash Equivalence server be set up to
> +   correspond with a given Shared State cache, and to start this server
> +   in *read-only mode*, so that it doesn't store equivalences for
> +   Shared State caches that are local to clients.
> +
> +   See the :term:`BB_HASHSERVE` reference for details about starting
> +   a Hash Equivalence server.
> +
> +See the `video <https://www.youtube.com/watch?v=3DzXEdqGS62Wc>`__
> +of Joshua Watt's `Hash Equivalence and Reproducible Builds
> +<https://elinux.org/images/3/37/Hash_Equivalence_and_Reproducible_Builds=
.pdf>`__
> +presentation at ELC 2020 for a very synthetic introduction to the
> +Hash Equivalence implementation in the Yocto Project.
> +
>  Automatically Added Runtime Dependencies
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

