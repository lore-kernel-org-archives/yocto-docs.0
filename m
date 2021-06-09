Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.11259.1623259214951710950
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 10:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DEF371BF209;
	Wed,  9 Jun 2021 17:20:12 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] test-manual: Add initial YP Compatible documentation
To: docs@lists.yoctoproject.org
References: <20210608090255.3089963-1-richard.purdie@linuxfoundation.org>
 <CAP71Wjz00a3yyG30f3s9zMU3yKFHRDQb_DWP5frdG=NabKTx9A@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3dadbe55-dcb1-75af-e5af-b3f02f896080@bootlin.com>
Date: Wed, 9 Jun 2021 19:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71Wjz00a3yyG30f3s9zMU3yKFHRDQb_DWP5frdG=NabKTx9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nico,

Thanks for the review!

On 6/9/21 12:11 PM, Nicolas Dechesne wrote:
>
>
> Insert link
> to https://docs.yoctoproject.org/dev-manual/common-tasks.html?layer#making-sure-your-layer-is-compatible-with-yocto-project
> <https://docs.yoctoproject.org/dev-manual/common-tasks.html?layer#making-sure-your-layer-is-compatible-with-yocto-project>


Done, in the V2 I'll share soon. However, this feels a bit weird as
there is some overlap between both documents. Wouldn't it be better to
add this reference at the end of the document instead?

>
>
> tried -> tied


Fixed

>  
>
>     +
>     +The project encourages all layer maintainers to consider the
>     questions and the output from the script against their layer as
>     there are often unintentional consequences of the way some layers
>     are constructed and the questions and script are designed to
>     highlight commonly known issues which can often easily be solved
>     leading to easier and wider layer use.
>     +
>     +It is intended that over time, the tests will evolve as best
>     known practices are identified and as new interoperability issues
>     are identified which unnecessarily restrict layer
>     interoperability. If anyone becomes aware of either issue, please
>     do mention it to the project (in our tech calls, on the mailing
>     list or to the TSC). The TSC is holds overall responsibility for
>     the technical criteria used by the programme.
>
>
> is holds -> holds

Fixed
>  
>
>     +* Where multiple types of functionality are present, the layer be
>     internally subdivided into layers to separate these components as
>     users would likely want to use only one of them and separability
>     is a key best practise.
>
>
> the layer be -> the layer should be?


Fixed

>  
>
>     +* Adding a layer to a build should not change that build without
>     the user taking some additional step of configuration to active
>     the layer (such as selecting a MACHINE, a DISTRO or a DISTRO_FEATURE)
>     +
>     +The project does test the compatibility status of the core
>     project layers on the project autobuilder.
>     +
>     +The official form to submit compatibility requests with is at
>     https://www.yoctoproject.org/ecosystem/branding/compatible-registration/
>     <https://www.yoctoproject.org/ecosystem/branding/compatible-registration/>.
>     Successful applicants can display the appropraiate badge which
>     would be provided to them on success of the application.
>
>
> :yocto_home:` xxx `

Fixed too, thanks!

The V2 for further review is coming next. Thanks in advance :)

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

