Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.8050.1616167935413661630
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.9] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3829E1BF209;
	Fri, 19 Mar 2021 15:32:13 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: Inconsistent use of "cd ~/poky" and "cd poky" in the manuals
Organization: Bootlin
Message-ID: <9c893145-b926-10ca-35f0-ce4348110d49@bootlin.com>
Date: Fri, 19 Mar 2021 16:32:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

I'm joining the project to help with the documentation...

By going through the "Yocto Project Quick Build" instructions
(https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#), and
I've noticed an inconsistency that impacts several documents...

People are first instructed to clone the poky git repository, but not
mentioning from which directory. Then, it's consistent to instruct
people to run "cd poky/".

However, later in the instructions, readers are instructed to run "cd
~/poky", which assumes that cloning poky was done from the home
directory. Many other places in the documentation make such an assumption:

documentation/README:      $ mkdir ~/poky-&DISTRO;
documentation/dev-manual/common-tasks.rst:      $ cd ~/poky
documentation/dev-manual/common-tasks.rst:      $ wic cp ~/poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
documentation/dev-manual/common-tasks.rst:               ~/poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
documentation/dev-manual/common-tasks.rst:   ``~/poky/build/conf/local.conf``).
documentation/dev-manual/common-tasks.rst:directory of ``~/poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
documentation/dev-manual/common-tasks.rst:   $ cd ~/poky/build/tmp/deploy/rpm
documentation/dev-manual/common-tasks.rst:   $ ~/poky/poky/scripts/buildhistory-diff . HEAD^
documentation/dev-manual/common-tasks.rst:   ``~/poky/scripts``).
documentation/dev-manual/common-tasks.rst:      $ ~/poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
documentation/dev-manual/common-tasks.rst:      $ ~/poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@yoctoproject.org
documentation/dev-manual/qemu.rst:         $ cd ~/poky
documentation/dev-manual/qemu.rst:         . ~/poky_sdk/environment-setup-core2-64-poky-linux
documentation/dev-manual/start.rst:      $ cd ~/poky
documentation/kernel-dev/common.rst:      $ cd ~/poky
documentation/kernel-dev/common.rst:   ``~/poky/build`` in this example).
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      ~/poky/build/tmp/deploy/sdk
documentation/kernel-dev/common.rst:   ``~/poky_sdk`` directory:
documentation/kernel-dev/common.rst:      $ cd ~/poky/build/tmp/deploy/sdk
documentation/kernel-dev/common.rst:      Enter target directory for SDK (default: ~/poky_sdk):
documentation/kernel-dev/common.rst:      $ source ~/poky_sdk/environment-setup-i586-poky-linux
documentation/kernel-dev/common.rst:      $ cd ~/poky
documentation/kernel-dev/common.rst:   ``~/poky/build`` in this example).
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      ``~/poky_sdk/workspace/sources/linux-yocto``). Change to where the
documentation/kernel-dev/common.rst:         $ cd ~/poky_sdk/workspace/sources/linux-yocto
documentation/kernel-dev/common.rst:      $ cd ~/poky_sdk/workspace/sources/linux-yocto
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      $ cd ~/poky/build/conf
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:      $ cd ~/poky/build
documentation/kernel-dev/common.rst:              $ cd ~/poky/build
documentation/kernel-dev/common.rst:Directory's top-level folder is ``~/poky``:
documentation/sdk-manual/appendix-obtain.rst:      $ cd ~/poky/build/tmp/deploy/sdk
documentation/sdk-manual/appendix-obtain.rst:      $ source ~/poky_sdk/environment-setup-core2-64-poky-linux
documentation/sdk-manual/extensible.rst:   Enter target directory for SDK (default: ~/poky_sdk):
documentation/toaster-manual/reference.rst:   $ cd ~/poky/build
documentation/toaster-manual/setup-and-use.rst:      $ cd ~/poky/build
documentation/toaster-manual/setup-and-use.rst:      cd ~/poky/

That's more than the other choice:

documentation/brief-yoctoprojectqs/index.rst:   $ cd poky
documentation/brief-yoctoprojectqs/index.rst:      $ cd poky
documentation/brief-yoctoprojectqs/index.rst:      $ cd poky
documentation/brief-yoctoprojectqs/index.rst:      $ cd poky/build
documentation/brief-yoctoprojectqs/index.rst:   $ cd poky
documentation/dev-manual/common-tasks.rst:   $ cd poky
documentation/kernel-dev/common.rst:   $ cd poky
documentation/overview-manual/development-environment.rst:   $ cd poky
documentation/overview-manual/development-environment.rst:   $ cd poky
documentation/ref-manual/features.rst:   $ cd poky
documentation/ref-manual/system-requirements.rst:      $ cd poky
documentation/ref-manual/system-requirements.rst:      $ cd poky
documentation/toaster-manual/setup-and-use.rst:   $ cd poky

I could propose a patch that explicitly assumes that poky is cloned from
the home directory, making it clear that it's just to simplify the
documentation and doesn't correspond to any technical recommendation.
The advantage I see is that users that just want to copy and paste
commands won't have to use their brains to adapt the commands.

On the other hand, my second idea was to stop assuming that poky was
cloned from the home directory, and propose a patch that replaces
"~/poky/" by "poky/" everywhere, assuming that people using the Yocto
Project know how to use their brains anyway and understand where they're
storing their data ;-)

What would be your preference? Has this already been discussed?

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

