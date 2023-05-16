Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4000FC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 07:45:21 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.15716.1684223112116810761
 for <docs@lists.yoctoproject.org>;
 Tue, 16 May 2023 00:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [172.31.28.27] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 2B12C8038961E;
	Tue, 16 May 2023 16:45:10 +0900 (JST)
Message-ID: <c8174cd5-ee37-2c20-bc0d-33a0c3e57d7b@lineo.co.jp>
Date: Tue, 16 May 2023 16:45:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [docs] [PATCH] releases.svg: update according to latest release
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230508055100.2204477-1-michael.opdenacker@bootlin.com>
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <20230508055100.2204477-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 May 2023 07:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3943

Hi Michael

I see that the last point release of Yocto 3.3 was on 4/28/2022, and I 
think Hardknott's line needs to be extended by 6 months.

On 2023/05/08 14:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Update the Mickledore starting and ending time
> - Mickledore is no longer a future release
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/svg/releases.svg | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
> index f2607244c8..50e3728ee9 100644
> --- a/documentation/ref-manual/svg/releases.svg
> +++ b/documentation/ref-manual/svg/releases.svg
> @@ -383,9 +383,9 @@
>        inkscape:window-height="1016"
>        id="namedview4"
>        showgrid="true"
> -     inkscape:zoom="0.72360224"
> -     inkscape:cx="889.30073"
> -     inkscape:cy="397.31773"
> +     inkscape:zoom="1.4472045"
> +     inkscape:cx="777.01528"
> +     inkscape:cy="286.41426"
>        inkscape:window-x="1994"
>        inkscape:window-y="27"
>        inkscape:window-maximized="1"
> @@ -562,9 +562,9 @@
>       <rect
>          style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
>          id="rect917-0-0-4-4-9-4"
> -       width="140.00002"
> +       width="160.00002"
>          height="45.000004"
> -       x="960"
> +       x="959.99994"
>          y="-120"
>          ry="2.2558987" />
>       <text
> @@ -584,26 +584,26 @@
>            style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
>            id="tspan10317-2-9-1">4.1</tspan></text>
>       <rect
> -       style="opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
> +       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
>          id="rect917-0-0-4-4-9-4-5"
>          width="140.00002"
>          height="45.000004"
> -       x="1080"
> -       y="-174.99998"
> +       x="1100"
> +       y="-175.00003"
>          ry="2.2558987" />
>       <text
>          xml:space="preserve"
>          style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
> -       x="1134.2344"
> +       x="1156.057"
>          y="-155.49881"
>          id="text1185-3-55-4-0-0-0-1"><tspan
>            sodipodi:role="line"
> -         x="1134.2344"
> +         x="1156.057"
>            y="-155.49881"
>            style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
>            id="tspan957-2-8-6-3-9-7">Mickledore</tspan><tspan
>            sodipodi:role="line"
> -         x="1134.2344"
> +         x="1156.057"
>            y="-137.50214"
>            style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
>            id="tspan10317-2-9-1-4">4.2</tspan></text>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3923): https://lists.yoctoproject.org/g/docs/message/3923
> Mute This Topic: https://lists.yoctoproject.org/mt/98755922/3617373
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [ito@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Takayasu Ito
Yocto Project Ambassador
Solution Department Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp


