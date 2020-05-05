Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.4343.1588705949198775038
 for <docs@lists.yoctoproject.org>;
 Tue, 05 May 2020 12:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:60702 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jW2zT-00HWrx-8T
	for docs@lists.yoctoproject.org; Tue, 05 May 2020 15:12:27 -0400
Date: Tue, 5 May 2020 15:12:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: looking for feedback on writeup about class/task inheritance
Message-ID: <alpine.LFD.2.21.2005051436490.26329@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  i wanted to write a tutorial on basic class/task inheritance WRT
bitbake and OE, and pull some actual examples from the OE code base
in, so i threw together the following and am interested in feedback as
to whether it's clear. this is just the first part -- i'm leaving out
the additional usage of EXPORT_FUNCTIONS for the time being until i
decide what i want it to say. (and, yes, what follows is incredibly
basic ... that's the point.)

  to start with, quick intro to most common tasks one will normally
inherit (initially from base.bbclass):

  do_configure()
  do_compile()
  do_install()
  do_package()

first thing to mention -- if you inherit these tasks and make
absolutely no changes to them, then you get them as is. so far, so
good?

  next observation, you can modify inherited tasks in a couple ways.
first way is to override it in its entirety -- plenty of examples of
that:

meta/recipes-core/newlib/newlib.inc:do_install() {
meta/recipes-core/musl/musl_git.bb:do_install() {
meta/recipes-core/musl/bsd-headers.bb:do_install() {
meta/recipes-core/musl/libucontext_git.bb:do_install() {
meta/recipes-core/musl/libssp-nonshared.bb:do_install() {
meta/recipes-core/dropbear/dropbear.inc:do_install() {
... etc etc ...

 on the other hand, you can *adjust* the inherited task with either
_append or _prepend -- once again, plenty of examples (i'll pick one
to display):

meta/recipes-extended/watchdog/watchdog_5.15.bb:do_install_append() {
meta/recipes-extended/iptables/iptables_1.8.4.bb:do_install_append() {
meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb:do_install_append() {
meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_install_append() {
meta/recipes-extended/bash/bash.inc:do_install_append () {

  and, finally, one can add overrides to any and all of the above,
either for simple overriding, or combining overriding with appending
or prepending:

meta/recipes-core/glibc/glibc-package.inc:do_install_armmultilib () {
...
meta/recipes-core/glibc/glibc-package.inc:do_install_append_aarch64 () {
meta/recipes-core/glibc/glibc-package.inc:do_install_append_arm () {
meta/recipes-core/glibc/glibc-package.inc:do_install_append_armeb () {
...

  and, finally, a point i think gets very little attention, and that
is that all of this applies to non-tasks as well, like this example:

meta-environment.bb:create_sdk_files() {
meta-environment-extsdk.bb:create_sdk_files_append() {

admittedly, not a lot of those, but still worth being complete in
mentioning it.

  that's all i'd start with, other than adding one more point -- if
one chooses to truly override an inherited function, there is no way
to *also* get access to the underlying inherited function of the same
name, short of the use of EXPORT_FUNCTIONS, is that correct?

  does the above seem reasonable? am i missing anything important
before dragging EXPORT_FUNCTIONS into it in part two?

rday
