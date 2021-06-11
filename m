Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.5943.1623402809806160571
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 02:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id C8E03100013;
	Fri, 11 Jun 2021 09:13:27 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/2] ref-manual: variables: document IMGDEPLOYDIR
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Daniel Wagenknecht <dwagenknecht@emlix.com>
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
 <20210611062613.188300-3-dwagenknecht@emlix.com>
 <CAP71WjxGyxR=2tTK8LyVrmPsOX4rd9_NsOTMbEYfr+kTH4UoLw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <de72c018-6ba1-b210-8599-2bd1a142c054@bootlin.com>
Date: Fri, 11 Jun 2021 11:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjxGyxR=2tTK8LyVrmPsOX4rd9_NsOTMbEYfr+kTH4UoLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Daniel, Nicolas,

Thank you for the patch and review.

On 6/11/21 8:46 AM, Nicolas Dechesne wrote:
>
>
>     +      It is usually not used directly in recipes, but filled with
>     the contents
>     +      of :term:`DEPLOYDIR` by the :ref:`deploy
>     <ref-classes-deploy>` class or
>     +      with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
>     +      <ref-classes-image>` class.
>
>
> The message should be even stronger. It *must* not be used in recipes
> when deploying files. It can be used only when a recipe need to 'read'
> a file already deployed by a dependency of course.


I can try to take care of this to save you time, Daniel... Here's what
I've included in my local branch meant to merge your changes into
"master-next" of yocto-docs.

      It must not be used directly in recipes when deploying files. Instead,
      it's only useful when a recipe needs to "read" a file already deployed
      by a dependency. So, it should be filled with the contents of
      :term:`DEPLOYDIR` by the :ref:`deploy <ref-classes-deploy>` class or
      with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
      <ref-classes-image>` class.

I'll be happy to rephrase if you have anything better.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

