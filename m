Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5580D0E6C7
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 08:03:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.40870.1729497799920719591
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 01:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Sz5blxx9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FD7D1C0003;
	Mon, 21 Oct 2024 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729497798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9KuvfAwbNwYOja7q2JAOYtEQgrgfzhZdYd5BcGvjTkA=;
	b=Sz5blxx9bmj7kj/Eyh+HeNpGWX8QeoBwJmtDeDsnoPAel+T2TjAdL/8tGETHn0cid8T7uR
	9iZoiF049x5z+lhhbDIu/KanmaT0FxqiR5WBGe5n8JhWxRgONym4vqthqr/ymywAwb3B0O
	tD50jGxJIiMTZSi++935651mVJwp1Wt4Hs+hhUC/+xXRvGevX+ZwcCvDfvmjsBzAvU0CPt
	h4R+PXRaZ3s/IFcAHoeB0Mi5nSlUPyKkTRMy/IiN1c0NTRAyJenG0mpzQ4iu3UdWA87aAu
	XERp/wIWKxxUZqtcL4W1p6K6sOF/k8f9WxEoW1aMafTqVmoldOwpqHAPEK1l4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 10:03:17 +0200
Message-Id: <D51BSVM1AA1B.3QOG4WS7JYOCK@bootlin.com>
Subject: Re: [docs] [PATCH v2] doc/user-manual: Refresh help output
Cc: <docs@lists.yoctoproject.org>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>, <bitbake-devel@lists.openembedded.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241018213626.2102737-1-yoann.congal@smile.fr>
In-Reply-To: <20241018213626.2102737-1-yoann.congal@smile.fr>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Oct 2024 08:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5540

Hi Yoann,

On Fri Oct 18, 2024 at 11:36 PM CEST, Yoann Congal via lists.yoctoproject.o=
rg wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> In commit 9257c48c3e36 ("Group and reorder options in bitbake help"),
> help output was changed, update the doc to match the new output.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> v1->v2: Review from Quentin Schulz
>  * Add Reviewed-By
>  * Add a comment with the command that generated the output
>  * whitespace cleanup
> ---
>  .../bitbake-user-manual-intro.rst             | 174 ++++++++++--------
>  1 file changed, 100 insertions(+), 74 deletions(-)
>
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/=
bitbake-user-manual/bitbake-user-manual-intro.rst
> index 35ffb88b0..539bb62d8 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> @@ -349,40 +349,84 @@ Usage and syntax
>  Following is the usage and syntax for BitBake::
>
>     $ bitbake -h
> -   Usage: bitbake [options] [recipename/target recipe:do_task ...]
> -
> -       Executes the specified task (default is 'build') for a given set =
of target recipes (.bb files).
> -       It is assumed there is a conf/bblayers.conf available in cwd or i=
n BBPATH which
> -       will provide the layer, BBFILES and other configuration informati=
on.
> +   usage: bitbake [-s] [-e] [-g] [-u UI] [--version] [-h] [-f] [-c CMD]
> +                  [-C INVALIDATE_STAMP] [--runall RUNALL] [--runonly RUN=
ONLY]
> +                  [--no-setscene] [--skip-setscene] [--setscene-only] [-=
n] [-p]
> +                  [-k] [-P] [-S SIGNATURE_HANDLER] [--revisions-changed]
> +                  [-b BUILDFILE] [-D] [-l DEBUG_DOMAINS] [-v] [-q]
> +                  [-w WRITEEVENTLOG] [-B BIND] [-T SERVER_TIMEOUT]
> +                  [--remote-server REMOTE_SERVER] [-m] [--token XMLRPCTO=
KEN]
> +                  [--observe-only] [--status-only] [--server-only] [-r P=
REFILE]
> +                  [-R POSTFILE] [-I EXTRA_ASSUME_PROVIDED]
> +                  [recipename/target ...]
> +
> +   It is assumed there is a conf/bblayers.conf available in cwd or in BB=
PATH
> +   which will provide the layer, BBFILES and other configuration informa=
tion.
> +
> +   General options:
> +     recipename/target     Execute the specified task (default is 'build=
') for
> +                           these target recipes (.bb files).
> +     -s, --show-versions   Show current and preferred versions of all re=
cipes.
> +     -e, --environment     Show the global or per-recipe environment com=
plete
> +                           with information about where variables were
> +                           set/changed.
> +     -g, --graphviz        Save dependency tree information for the spec=
ified
> +                           targets in the dot syntax.
> +     -u UI, --ui UI        The user interface to use (knotty, ncurses, t=
askexp,
> +                           taskexp_ncurses or teamcity - default knotty)=
.
> +     --version             Show programs version and exit.
> +     -h, --help            Show this help message and exit.
>
> -   Options:
> -     --version             show program's version number and exit
> -     -h, --help            show this help message and exit
> -     -b BUILDFILE, --buildfile=3DBUILDFILE
> -                           Execute tasks from a specific .bb recipe dire=
ctly.
> -                           WARNING: Does not handle any dependencies fro=
m other
> -                           recipes.
> -     -k, --continue        Continue as much as possible after an error. =
While the
> -                           target that failed and anything depending on =
it cannot
> -                           be built, as much as possible will be built b=
efore
> -                           stopping.
> +   Task control options:
>       -f, --force           Force the specified targets/task to run (inva=
lidating
>                             any existing stamp file).
> -     -c CMD, --cmd=3DCMD     Specify the task to execute. The exact opti=
ons
> +     -c CMD, --cmd CMD     Specify the task to execute. The exact option=
s
>                             available depend on the metadata. Some exampl=
es might
>                             be 'compile' or 'populate_sysroot' or 'listta=
sks' may
>                             give a list of the tasks available.
> -     -C INVALIDATE_STAMP, --clear-stamp=3DINVALIDATE_STAMP
> +     -C INVALIDATE_STAMP, --clear-stamp INVALIDATE_STAMP
>                             Invalidate the stamp for the specified task s=
uch as
>                             'compile' and then run the default task for t=
he
>                             specified target(s).
> -     -r PREFILE, --read=3DPREFILE
> -                           Read the specified file before bitbake.conf.
> -     -R POSTFILE, --postread=3DPOSTFILE
> -                           Read the specified file after bitbake.conf.
> -     -v, --verbose         Enable tracing of shell tasks (with 'set -x')=
. Also
> -                           print bb.note(...) messages to stdout (in add=
ition to
> -                           writing them to ${T}/log.do_&lt;task&gt;).
> +     --runall RUNALL       Run the specified task for any recipe in the =
taskgraph
> +                           of the specified target (even if it wouldn't =
otherwise
> +                           have run).
> +     --runonly RUNONLY     Run only the specified task within the taskgr=
aph of
> +                           the specified targets (and any task dependenc=
ies those
> +                           tasks may have).
> +     --no-setscene         Do not run any setscene tasks. sstate will be=
 ignored
> +                           and everything needed, built.
> +     --skip-setscene       Skip setscene tasks if they would be executed=
. Tasks
> +                           previously restored from sstate will be kept,=
 unlike
> +                           --no-setscene.
> +     --setscene-only       Only run setscene tasks, don't run any real t=
asks.
> +
> +   Execution control options:
> +     -n, --dry-run         Don't execute, just go through the motions.
> +     -p, --parse-only      Quit after parsing the BB recipes.
> +     -k, --continue        Continue as much as possible after an error. =
While the
> +                           target that failed and anything depending on =
it cannot
> +                           be built, as much as possible will be built b=
efore
> +                           stopping.
> +     -P, --profile         Profile the command and save reports.
> +     -S SIGNATURE_HANDLER, --dump-signatures SIGNATURE_HANDLER
> +                           Dump out the signature construction informati=
on, with
> +                           no task execution. The SIGNATURE_HANDLER para=
meter is
> +                           passed to the handler. Two common values are =
none and
> +                           printdiff but the handler may define more/les=
s. none
> +                           means only dump the signature, printdiff mean=
s
> +                           recursively compare the dumped signature with=
 the most
> +                           recent one in a local build or sstate cache (=
can be
> +                           used to find out why tasks re-run when that i=
s not
> +                           expected)
> +     --revisions-changed   Set the exit code depending on whether upstre=
am
> +                           floating revisions have changed or not.
> +     -b BUILDFILE, --buildfile BUILDFILE
> +                           Execute tasks from a specific .bb recipe dire=
ctly.
> +                           WARNING: Does not handle any dependencies fro=
m other
> +                           recipes.
> +
> +   Logging/output control options:
>       -D, --debug           Increase the debug level. You can specify thi=
s more
>                             than once. -D sets the debug level to 1, wher=
e only
>                             bb.debug(1, ...) messages are printed to stdo=
ut; -DD
> @@ -392,65 +436,47 @@ Following is the usage and syntax for BitBake::
>                             -D only affects output to stdout. All debug m=
essages
>                             are written to ${T}/log.do_taskname, regardle=
ss of the
>                             debug level.
> +     -l DEBUG_DOMAINS, --log-domains DEBUG_DOMAINS
> +                           Show debug logging for the specified logging =
domains.
> +     -v, --verbose         Enable tracing of shell tasks (with 'set -x')=
. Also
> +                           print bb.note(...) messages to stdout (in add=
ition to
> +                           writing them to ${T}/log.do_<task>).
>       -q, --quiet           Output less log message data to the terminal.=
 You can
>                             specify this more than once.
> -     -n, --dry-run         Don't execute, just go through the motions.
> -     -S SIGNATURE_HANDLER, --dump-signatures=3DSIGNATURE_HANDLER
> -                           Dump out the signature construction informati=
on, with
> -                           no task execution. The SIGNATURE_HANDLER para=
meter is
> -                           passed to the handler. Two common values are =
none and
> -                           printdiff but the handler may define more/les=
s. none
> -                           means only dump the signature, printdiff mean=
s compare
> -                           the dumped signature with the cached one.
> -     -p, --parse-only      Quit after parsing the BB recipes.
> -     -s, --show-versions   Show current and preferred versions of all re=
cipes.
> -     -e, --environment     Show the global or per-recipe environment com=
plete
> -                           with information about where variables were
> -                           set/changed.
> -     -g, --graphviz        Save dependency tree information for the spec=
ified
> -                           targets in the dot syntax.
> -     -I EXTRA_ASSUME_PROVIDED, --ignore-deps=3DEXTRA_ASSUME_PROVIDED
> -                           Assume these dependencies don't exist and are=
 already
> -                           provided (equivalent to ASSUME_PROVIDED). Use=
ful to
> -                           make dependency graphs more appealing
> -     -l DEBUG_DOMAINS, --log-domains=3DDEBUG_DOMAINS
> -                           Show debug logging for the specified logging =
domains
> -     -P, --profile         Profile the command and save reports.
> -     -u UI, --ui=3DUI        The user interface to use (knotty, ncurses,=
 taskexp or
> -                           teamcity - default knotty).
> -     --token=3DXMLRPCTOKEN   Specify the connection token to be used whe=
n
> -                           connecting to a remote server.
> -     --revisions-changed   Set the exit code depending on whether upstre=
am
> -                           floating revisions have changed or not.
> -     --server-only         Run bitbake without a UI, only starting a ser=
ver
> -                           (cooker) process.
> -     -B BIND, --bind=3DBIND  The name/address for the bitbake xmlrpc ser=
ver to bind
> +     -w WRITEEVENTLOG, --write-log WRITEEVENTLOG
> +                           Writes the event log of the build to a bitbak=
e event
> +                           json file. Use '' (empty string) to assign th=
e name
> +                           automatically.
> +
> +   Server options:
> +     -B BIND, --bind BIND  The name/address for the bitbake xmlrpc serve=
r to bind
>                             to.
> -     -T SERVER_TIMEOUT, --idle-timeout=3DSERVER_TIMEOUT
> +     -T SERVER_TIMEOUT, --idle-timeout SERVER_TIMEOUT
>                             Set timeout to unload bitbake server due to
>                             inactivity, set to -1 means no unload, defaul=
t:
>                             Environment variable BB_SERVER_TIMEOUT.
> -     --no-setscene         Do not run any setscene tasks. sstate will be=
 ignored
> -                           and everything needed, built.
> -     --skip-setscene       Skip setscene tasks if they would be executed=
. Tasks
> -                           previously restored from sstate will be kept,=
 unlike
> -                           --no-setscene
> -     --setscene-only       Only run setscene tasks, don't run any real t=
asks.
> -     --remote-server=3DREMOTE_SERVER
> +     --remote-server REMOTE_SERVER
>                             Connect to the specified server.
>       -m, --kill-server     Terminate any running bitbake server.
> +     --token XMLRPCTOKEN   Specify the connection token to be used when
> +                           connecting to a remote server.
>       --observe-only        Connect to a server as an observing-only clie=
nt.
>       --status-only         Check the status of the remote bitbake server=
.
> -     -w WRITEEVENTLOG, --write-log=3DWRITEEVENTLOG
> -                           Writes the event log of the build to a bitbak=
e event
> -                           json file. Use '' (empty string) to assign th=
e name
> -                           automatically.
> -     --runall=3DRUNALL       Run the specified task for any recipe in th=
e taskgraph
> -                           of the specified target (even if it wouldn't =
otherwise
> -                           have run).
> -     --runonly=3DRUNONLY     Run only the specified task within the task=
graph of
> -                           the specified targets (and any task dependenc=
ies those
> -                           tasks may have).
> +     --server-only         Run bitbake without a UI, only starting a ser=
ver
> +                           (cooker) process.
> +
> +   Configuration options:
> +     -r PREFILE, --read PREFILE
> +                           Read the specified file before bitbake.conf.
> +     -R POSTFILE, --postread POSTFILE
> +                           Read the specified file after bitbake.conf.
> +     -I EXTRA_ASSUME_PROVIDED, --ignore-deps EXTRA_ASSUME_PROVIDED
> +                           Assume these dependencies don't exist and are=
 already
> +                           provided (equivalent to ASSUME_PROVIDED). Use=
ful to
> +                           make dependency graphs more appealing.
> +
> +..
> +    Bitbake help output generated with "stty columns 80; bin/bitbake -h"
>
>  .. _bitbake-examples:
>

Thank you, adding my +1 too.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin
--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

