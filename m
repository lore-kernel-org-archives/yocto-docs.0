Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B845CC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 14:44:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.363.1698763452264484887
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 07:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UNIMjN1U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F08541C0006;
	Tue, 31 Oct 2023 14:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698763450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/Ht2mdUB33kHU5dT5PKqUyIMyI0XK6+N5JYPv19g7w=;
	b=UNIMjN1Uz0cO/aDQpK+X3h2/e6k9OjxQTlvyvUbAXssZOEwmtx9wOGc5sIS5kbxHaeOoXh
	cHvJfWyGCEeuzey7Wb+PfZoyT4AI014Dsv13apPcfHoFiJOJ+lMcZ5vss95EfrH1kBIbGk
	acrpU2FvtWBxXcVVfZdWRPh3KqZBfIASFvO9v1qUhkigdj52kKIqpkIrMiSqF6TbNzaJ2Q
	ct3NDfIAmn7nSragcOWAHLDPhBR+vxOLtkGKSEbhql3Jj7kecZBgyx5mQ2DyjbtLUf62ck
	bnrPaKHkZjrQu1XrOirTdwUO2AV4AKQGFeyNSEEpmvwtvT5pNkIuiE1MMEx+Xw==
Message-ID: <da2e6ce3-4338-4273-816e-8fba92f6e0ca@bootlin.com>
Date: Tue, 31 Oct 2023 15:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] overview-manual: concepts: Add Bitbake Tasks Map
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231027155312.577723-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231027155312.577723-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 14:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4541

Hi Talel,

Many thanks for all this work!
See my comments below... Sorry, mostly nitpicking and style 
improvements, but I do it before Quentin Schulz or Robert P. J. Day wake 
up ;-)

On 27.10.23 at 17:53, BELHADJ SALEM Talel wrote:
> Create a Map to detail how Bitbake handles a recipe's tasks
> and its runtime dependencies along with detailed comments.
>
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/overview-manual/concepts.rst    | 174 ++++++++++++++++++
>   .../figures/bitbake_tasks_map.png             | Bin 0 -> 3896032 bytes
>   .../overview-manual/svg/bitbake_tasks_map.svg |   4 +
>   3 files changed, 178 insertions(+)
>   create mode 100644 documentation/overview-manual/figures/bitbake_tasks_map.png
>   create mode 100644 documentation/overview-manual/svg/bitbake_tasks_map.svg
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 4e3f6425a..d81710a85 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -2189,3 +2189,177 @@ For more information, see the
>   BitBake User Manual. You can also reference the "`Why Not
>   Fakeroot? <https://github.com/wrpseudo/pseudo/wiki/WhyNotFakeroot>`__"
>   article for background information on Fakeroot and Pseudo.
> +
> +Bitbake Tasks Map


s/Bitbake/BitBake/, as in the rest of the manual

> +=================
> +
> +To understand how Bitbake operates in the build directory and environment
> +we can consider the following recipes and diagram to have full image


I would add a comma after "diagram". It's a long sentence!

> +about where and what bitbake does as a job (tasks) in order to generate
> +the final recipe's package file.

"where" sounds weird for a computer task, and the wording sounds 
unnecessarily complicated anyway. What about instead?

"to have the full picture about the tasks that BitBake runs to generate 
the final package file for the recipe."

> +
> +We will have two recipes as an example:
> +
> +-  libhello: A recipe that provides a shared library


``libhello`

> +-  sayhello: A recipe that uses ``libhello`` library to do its job


``sayhello``

> +
> +.. note::
> +
> +   ``sayhello`` depends on ``libhello`` at compile time as it needs the shared
> +   library to do the dynamic linking process, also it depends on it at runtime
> +   as the loader needs to find the library in the rootfs.

I'd simplify and split this sentence too. What about?

"``sayhello`` depends on ``libhello`` at compile time as it needs the 
shared library at compile time. It also depends on it at runtime as the 
shared library loader needs to find the library in the root filesystem."

> +   For more about dependencies check :ref:`ref-varlocality-recipe-dependencies`.

s/For more/For more details/

> +
> +Since we want to create two recipes for ``libhello`` and ``sayhello``, we need
> +the source files in order for Bitbake to work with.

I'd remove this sentence completely. You already said we need two recipes.

> +
> +``libhello`` sources are as follows:
> +
> +-  ``LICENSE``: This is the License associated with this library

s/License/license/

> +-  ``Makefile``: The file used by ``make`` to build the library
> +-  ``hellolib.c``: The implementation of the library
> +-  ``hellolib.h``: The functions prototypes of the library

s/functions prototypes/C headers/

> +
> +``sayhello`` sources are as follows:
> +
> +-  ``LICENSE``: This is the License associated with this project
> +-  ``Makefile``: The file used by ``make`` to build the project
> +-  ``sayhello.c``: The source file of the project
> +
> +Before presenting the content of each file, here are the steps
s/content/contents/
> +that we need to follow to accomplish what we want in the first place
Put "," right after "place", otherwise you have a space between "place" 
and the comma.
> +, which is integrating ``sayhello`` in our final rootfs:

s/rootfs/root filesystem/

> +
> +#. Create a Git repository for each project with the corresponding files
> +#. Create a recipe for each project
> +#. Make sure that ``sayhello`` recipe :term:`DEPENDS` on ``libhello``
> +#. Make sure that ``sayhello`` recipe :term:`RDEPENDS` on ``libhello``
> +#. Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it into
> +   the final rootfs

Same here
> +
> +The following is the content of ``libhello/Makefile``::

s/is the content/are the contents/ IMHO

> +
> +   LIB=libhello.so
> +
> +   all: $(LIB)
> +
> +   $(LIB): hellolib.o
> +      $(CC) $< -Wl,-soname,$(LIB).1 -fPIC $(LDFLAGS) -shared -o $(LIB).1.0
> +
> +   %.o: %.c
> +      $(CC) -c $<
> +
> +   clean:
> +      rm -rf *.o *.so*
> +
> +.. note::
> +
> +   When creating shared libraries, it is very recommended to include ``SONAME``
> +   header and the full version format. (see `this article
> +   <https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html>`__
> +   for some background)

s/very recommended/strongly recommended/?
You should also put the final dot after the closing parenthesis.

Anyway, your example doesn't really illustrate what you mean about SONAME.
If you want to do this, shouldn't you set
SONAME=libhello.so
instead?

Could you clarify what you meant?

> +
> +.. note::
> +
> +   When creating ``Makefile`` files it is very recommended to use ``CC``, ``LDFLAGS``
> +   and ``CFLAGS`` as Bitbake will set them as environment variables according
> +   to your build configuration.

s/Bitbake/BitBake/

> +
> +The following is the content of ``libhello/hellolib.h``::


s/is the content/are the contents/ (please change that in the following 
paragraphs too)

> +
> +   #ifndef HELLOLIB_H
> +   #define HELLOLIB_H
> +
> +   void Hello();
> +
> +   #endif
> +
> +The following is the content of ``libhello/hellolib.c``::
> +
> +   #include <stdio.h>
> +
> +   void Hello(){
> +      puts("Hello from a Yocto demo \n");
> +   }
> +
> +The following is the content of ``sayhello/Makefile``::
> +
> +   EXEC=sayhello
> +   LDFLAGS += -lhello
> +
> +   all: $(EXEC)
> +
> +   $(EXEC): sayhello.c
> +      $(CC) $< $(LDFLAGS) $(CFLAGS) -o $(EXEC)
> +
> +   clean:
> +      rm -rf $(EXEC) *.o
> +
> +The following is the content of ``sayhello/sayhello.c``::
> +
> +   #include <hellolib.h>
> +
> +   int main(){
> +      Hello();
> +      return 0;
> +   }
> +
> +The following is the content of ``libhello_0.1.bb``::
> +
> +   SUMMARY = "Hello demo library"
> +   DESCRIPTION = "Hello shared library used in Yocto demo"
> +
> +   # NOTE: Set the License according to the LICENSE file of your project
> +   #       and then add LIC_FILES_CHKSUM accordingly
> +   LICENSE = "CLOSED"
> +
> +   # Assuming the branch is main
> +   # Change <username> accordingly
> +   SRC_URI = "git://github.com/<username>/libhello;branch=main;protocol=https"
> +
> +   S = "${WORKDIR}/git"
> +
> +   do_install(){
> +      install -d ${D}${includedir}
> +      install -d ${D}${libdir}
> +
> +      install hellolib.h ${D}${includedir}
> +      oe_soinstall ${PN}.so.${PV} ${D}${libdir}
> +   }
> +
> +The following is the content of ``sayhello_0.1.bb``::
> +
> +   SUMMARY = "SayHello demo"
> +   DESCRIPTION = "SayHello project used in Yocto demo"
> +
> +   # NOTE: Set the License according to the LICENSE file of your project
> +   #       and then add LIC_FILES_CHKSUM accordingly
> +   LICENSE = "CLOSED"
> +
> +   # Assuming the branch is main
> +   # Change <username> accordingly
> +   SRC_URI = "git://github.com/<username>/sayhello;branch=main;protocol=https"
> +
> +   DEPENDS += "libhello"
> +   RDEPENDS:${PN} += "libhello"
> +
> +   S = "${WORKDIR}/git"
> +
> +   do_install(){
> +      install -d ${D}/usr/bin
> +      install -m 0700 sayhello ${D}/usr/bin
> +   }
> +
> +After placing the recipes in a custom layer we can run ``bitbake sayhello``
> +to build the recipe.
> +
> +The following diagram shows the map of where and how Bitbake will perform the tasks
> +to accomplish that.

I'd suggest...

"The following diagram shows the sequences of tasks that BitBake 
executes to accomplish that."

> +
> +.. image:: figures/bitbake_tasks_map.png
> +   :width: 100%


The diagram is nice and looks friendly to e-ink display and color-blind 
readers!
However, you should only include the .svg version in your patch. See 
overview-manual/svg/git-workflow.svg for example.

Plus including the PNG version made your e-mail gigantic :-/

However too, there's one thing I don't quite like, which is the use of 
"??" as it looks weird to me. It initially made me think about something 
you forgot to fill. What about using "pkg" or "PGK" in italic and 
explain what values it can take as you did for "??"

Thanks for all your work, and thanks in advance for the new version!
Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


