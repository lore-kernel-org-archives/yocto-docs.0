Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0331FC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:06:31 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.74])
 by mx.groups.io with SMTP id smtpd.web09.8085.1646910389953874830
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 03:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=q9A8Xkw3;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLw+tR/bgiz98lOqZM8SQWqzDi9zU6oUalZqXdHcuE6YOUX+3UOF9I6/50qsMJV9l84dFxtpGi+e3pn5M1dy9kaTZPG1HgZo0dfCbzNcRRBJJWxvkU+ES00FsNAjHHNrBGETe/B4SYIsriLCL/vTEyOEmsvmgORz1eQCviPdOoGa9s9Wx/pPWNt1RD2F9LxIN5QdKj93qeG5Ie7HXCam/AShsrY3ZaJ/yxEfwfU78YX97JLU5YP115zLG8DSntsoFwS14R1QNF2UCbgVQWq93kfdo01Ig9Ea6WPRDYLjBONeLyGUAKr53J936mNOCObrXGHWHh3arCH1AG/YDXcw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRhsTnJowTo0zIKfgHq02kAIeD7kA5gMmMMLTbPmPOo=;
 b=QRM18eqLxuARGZw/kW4yisPtMyLcn/iJedBqqmlWGQsuHnXEs+WXGvvK1t5PG3xzLHMvVH1JuCgbPk0EHUZlHMaUbsjnv/IklxT2jwWLcJ6bSQltaKL09LheBftIppkEtGHf+rm/b4XEPFsTITk5M+XdivXV5WbL8Qjbnstpfmy6lBpwT62J+nlTZYHr8NR/9xMp7lOD0ra1wcicZvUrdWT4QCdSR1hgjvXhTjEr6GG7P59CGehLZS8Zbst48hybyHhl0cJfTU9iCiDIysF5hVUxXmEAFfzP6kpGh9zmShLYP0Zvcvt6D/ugvxJLOSlk7rLiA0qGhulawmyrAukGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRhsTnJowTo0zIKfgHq02kAIeD7kA5gMmMMLTbPmPOo=;
 b=q9A8Xkw3Y0ecUNrR2bAE9ldolBOJs6xTQ5MnOWZ/GsRGjNzqzdxOHtg9zYQgZDmTbS4Tl6uKqpCQvURWpleA/H253XWrWEJ4YGnOgZyYo+uEn7iGuSAkQyhY+CHgDQXG5L6i4rut0pK4GRRVoz3Yr5fJXIH9CklwelD45BRTgC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB4734.eurprd04.prod.outlook.com (2603:10a6:803:5b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 11:06:24 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 11:06:24 +0000
Message-ID: <d722833f-f207-2f71-c80d-2c9c651d0ecd@theobroma-systems.com>
Date: Thu, 10 Mar 2022 12:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] dev-manual: details about using firewalls and
 limiting fetch threads
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220309160242.616026-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220309160242.616026-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::15) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b174e5ab-9561-4787-8cb4-08da0286042b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4734:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB4734A4F01ED60F39A8C0A28DC20B9@VI1PR04MB4734.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ITDvgCVOjWuk/JP1D8tvQI/GpGkfrGnbcgWDZtFsF9zcFrb62mMusqIE/K148AiKxFDbQScCr1R3GaS5jVns9OlpAZc/iahBf+L1VLxvctTBKcL0Bow2o/CZJ8ivp5UyP3xgaeI8hjG07ryMg3pj758BAoxkL1DSPsNo3f7j2vOy41TndF7L+At1BXOkukzXnKbFdqv0Ycy3DRT3E4rU1XCco/4arnWxrJFPpfhxiuewB6wnWqlotG4za7Gttk//ZK6GQl8qqGHLw4B3DCxPscuZdhH4bFcDGouYGVavvI36T5MY7Lks/v8STdNT8CwlZbd53XdAGWqUBUHJ5pbVexmD1r+N6Su2x0DKfc42IVb0oniR+1LVnmXmdvQFgf7pz1HgoS9RA/YpfNQU2LeWZmd3MMNa6bScswbmSbsOXsS6MqOykIY7cimSYV6oK00irqnLtgIgwCPx2Tp1kdf7MPDRKNEoumB33divPkUyl2t/0+1uKWR+M74L3BdaSsAflY5aIXwswZKR/lDlmeNzCI6WCd2V6t0AveXrk2PrWCUafX300rPpwEqXfI5gkODvRDWAjeEZATgrCF7j1tj0SyTAs0VpuKcfZxKEoIe1784hGRFtW65qrp+Xsodz0Q6wfTYxSA/ncZW2acrK4q3vptiZJvQsYqZI2ib+BBScxBSSB+jqtdvjwkTiI/AWALqTM4i38KTVP2uZQBGh6X4VROPpNeix36QIDZbVaAL6Ewk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6486002)(31696002)(508600001)(26005)(186003)(83380400001)(6512007)(6506007)(2616005)(53546011)(8676002)(66476007)(66556008)(66946007)(2906002)(8936002)(44832011)(5660300002)(36756003)(38100700002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGxJeG9LSDhCbDlmRWxrcFZNb2lxZUt6MFQ1UmdzVXhwSndqMHd1Smh0KzZZ?=
 =?utf-8?B?dEkzalBpTlJESVUwbzJhOFBZTDNnMmd1eW90QlljSzRySXdGcWh3Q2pRZ0Ew?=
 =?utf-8?B?THpzdVFSU0E5dXdLWkNYdXZGYWpTTTlocTNQVFMwRnBMN3lHOXpYdC8wck1t?=
 =?utf-8?B?ajJNU0FyaU9hTHVqWldtRG1kRmFUREZibUttbWh5Wld2OHpKQzhrQjNxSitx?=
 =?utf-8?B?d3g1elZqRjdCaHlFV1JwOGRwa0lSWXNUbmpvY3AwNXBLY3pIeWorZDNwcWgv?=
 =?utf-8?B?UmdlSlRxSFVjWEwrZGcvby9KTnlsaW9UYlpKTzdwY2ZXNXc4MVJJblFwQXkx?=
 =?utf-8?B?SXEvQnZoakoyd3pmNTYwaHo3ekZ1VWtWOGdlZUVmek1LRGc4VVFBb2xCL3Rn?=
 =?utf-8?B?UDJPSkZKMVI1bFE1VUJDaUZuSkFRd1hyVGFFYnVKdFk5TEZuenBBM0pxemZN?=
 =?utf-8?B?OUhrQTNPNjBRNThwQmlZaDFQOHI2aE1VYklhL2tvWW5oUkQyV3cvZEZrU0VM?=
 =?utf-8?B?eGdJNysxVlRSdkxuYTBjMmRoTEc5NWw0S05icVNOd0owRnl3STk1L09hN2x0?=
 =?utf-8?B?aXBrQytWdU4yQ1RzaXFpbWsrajF0N0RHN1BnQkwveFltdE5VZDcvY2EreEZi?=
 =?utf-8?B?cTErSC9WT05kcE9SQTNNdTBSVXU2WXV0emI1bEk0Wm9kVnRFSkt2YzFmaG01?=
 =?utf-8?B?ZFR4TFFkTmpsdnZ5c0Fob2N0Yk9YWjlybFNrZ1BMd3VvWDVLNXVyMUIxUjRR?=
 =?utf-8?B?cWZkbS8wTHBWd1FaUVFlNDE5aGZhWm5VVEVpRWdTMXdIMWR5cEdURGU3RmlG?=
 =?utf-8?B?clc5eURVQ0VCNzlzcGlZMUJlemtPN0xRWk5NRVpaTTVxN0g0MXd2bGRFVXhK?=
 =?utf-8?B?S1FFS0p3aFVlMWFVMDVrRTZHZ2VRL2VaalQrcmVNN29TZVM0eFhicHJzMXUy?=
 =?utf-8?B?VDdseXE4WWNRVVJ2L2RPbVBwZnRjWUNlbmZIZ1JZVVNpbDNhTy8rd0pENWdz?=
 =?utf-8?B?S1AwWjR5djExbGZUV1pyRitLTFd6SVhlWHh0TFh3RDZ3Q0ZxQ3pva0ttdmM3?=
 =?utf-8?B?cGRHdWxzSmU5eUpGdzROd2VqbWVrd0NsQmJ2QWxNNXNaeTJiWE5SUDVZODcx?=
 =?utf-8?B?djdIZVMrWUVaejgyejU2L29MSEdFdTBnUUI3aGMxZGFRdy83U3U3MEVEM0V0?=
 =?utf-8?B?YUlKWmo1TlJHckhEWFowV2UzRnkrUjlqN1lZRCtNQ2hUdG5zTzVNUGxSZURY?=
 =?utf-8?B?QnJaRlFXZFFuUFEzSUpHajV2MGlNanZKMWtGS3g5VzZGVmwvcldFNTU4R0VK?=
 =?utf-8?B?ZEpoTUZ1cjlTSHhsUVZsRlpJdUFHN3ZtcXpwemtBa0Z3MVVIcjNXWHJwUWZ0?=
 =?utf-8?B?cDdLZEhhdThzVy9UM3NjRFR2UStsWm92REpoSG8rODdSUjVKTzNHcG54YlFp?=
 =?utf-8?B?WnVFTUZtalhGY3pxZ1hETVcvTXduaFpUb1VlSitmTXUvLzlmU2ZDUmFEMmNN?=
 =?utf-8?B?aks1M2poVXFUd3h2TnJVRXQzV0ZCdENXTG11a3UvMW9paHowdFNsdnY2eWtT?=
 =?utf-8?B?WVRlVlh4WEh6dzhWdUtVWVo1U29EV3JiUU1hUTBwYTBtcmw0YkNXSTYra3hl?=
 =?utf-8?B?Sm96R3RjT09RSmJKZWFjc3dJTGF4NnRTMWNzTlp6aTl0RkJLZ1lmYkN2VlJx?=
 =?utf-8?B?eWJPZTJMRVhCR2JJak05enAzOCtITk1BRWFrMVpvckZsdnhHVWthT3VtSllD?=
 =?utf-8?B?ZmVEQkVRbmxneWVoVncycTNORFkvb2J5M0dOVUJTWTRMSUtETVFuMXJkUE0r?=
 =?utf-8?B?WGRYOVNpNnc5Z3lzby8wOURWem9aVjFxRlc3Wmp2UVRQSXdkbWpScGVUZDNE?=
 =?utf-8?B?ZDVaYmpsOFQ0S2NDc2tQQWluUStyUzVoeHQ2bHlHNDBnNlBSdTNsZDJNbkZH?=
 =?utf-8?B?WHQxTjVKcFdldXVDOHhCOFJHS2d5cFF0UUZxN243aDhTbE1SQXR6cCtlTmZv?=
 =?utf-8?B?Mm5qV3NHcVNUUjV5ZUVoTmw2MGtXNytsVVRaRW5NK24xeVpuM3pjWUNybXpN?=
 =?utf-8?B?dVIydEJ6aE9YSW1RK3ZBTmhVVGdkaTEva3JiZzVoVlRPVEZDOE5UZzB6SnFz?=
 =?utf-8?B?WGt6REFDbU96WmhkU0I3QVQ5Q2FjckgzdEU4dnpueVBzSkJJQ012QVZuR0VL?=
 =?utf-8?B?UDVBVGxMYXlTYW1OaitTNnhRREoySENCdEtxTy9EZ1lBRTZONDFoTDYzUkNT?=
 =?utf-8?B?VWZteXVJRWJnaHlhL1FUNWJneE5OajRQaHVna05LaWNyV1RXWnlqbGZnWUxU?=
 =?utf-8?B?dmQ0OHBEaTZKblFrckJXek9UY3pVUWR1NGZ3VHNOZE5UWE9wVnA2UT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b174e5ab-9561-4787-8cb4-08da0286042b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:06:24.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ev2rAJZVKdruzVOViV1nn2cBBufV/c+1fJ2Spw5QELt/GDNi2ua7LzOv07lZNwYat0XBLSJ/mkHuWoC0b4J8M4b4o7slFV4u5rMAdrkDNkZW2OkIQprIEAP+VR3/ZL8y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4734
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Mar 2022 11:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2577

Hi Michael,

On 3/9/22 17:02, Michael Opdenacker via lists.yoctoproject.org wrote:
> Fixes [YOCTO #13235]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/common-tasks.rst | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 1caf953901..609e38cbcd 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -1481,6 +1481,24 @@ compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
>   The build system automatically applies patches as described in the
>   ":ref:`dev-manual/common-tasks:patching code`" section.
>   
> +Fetching Code Through Firewalls
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Some users are behind firewalls and need to fetch code through a proxy.
> +See the ":doc:`/ref-manual/faq`" chapter for advice.
> +
> +Limiting the Number of Parallel Connections
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Some users are behind firewalls or use servers where the number of parallel connections
> +is limited. In such cases, you can limit the number of fetch tasks which run in parallel by
> +setting the below option in your ``local.conf`` file.
> +
> +The :yocto_git:`meta-poky/conf/local.conf.sample.extended </poky/tree/meta-poky/conf/local.conf.sample.extended>`
> +file shows how to set a maximum of four fetch tasks in parallel::
> +

Can suggest:

Some users are behind firewalls or use servers where the number of 
parallel connections is limited. In such cases, you can limit the
number of fetch tasks being run in parallel by adding the following
to your ``local.conf`` file::

> +   do_fetch[number_threads] = "4"
> +

Basically, I don't like "the below option" followed by another sentence.

But I'm more concerned about pointing to a file whose content I'm sure 
we won't actively monitor. I'm not sure it's an important piece of 
information to know if a sample configuration file has such an example?

What do you think?

Cheers,
Quentin

