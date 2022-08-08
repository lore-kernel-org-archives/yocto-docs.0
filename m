Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6565BC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 08:42:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web12.23241.1659948119129899988
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 01:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=L/96A8gi;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.75,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkKbuZhFK7xbLUQkAGTfWcCxdin9eHfBtuEaPUXXbtU8OvddQ7LYjU1HiLlr7XeKvWHs6brRiNTDeElPolXAG95K1JdBun+BIDHrp+D2+o9ERqRQ34YrsaiBftGTJQ0HNziY0HGpqyLaWG6PUfhetogijQ04RbkBZ+0xaqHBbUxOwSb+CS7E8PDortkiiod8oHCYuJ9wEUxUkaONHh5xNxpDIvUaqOsm8lszqRQlBeGlMdrs3e32kqztDc7K8R3jlKGGGg1LMIIgoHUEcs9r6B0qoY0dh1+sPMlpQvDK/clF1TFYD53TcHZbRnUaJJGzBUGQ1NGkzE7AV7inmKa+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0DkMK9E2Y92zzFttggOWfj/j0wQVPE7cKKkuqChyX8=;
 b=ck3K+7NIbfWGUoCfOTEEiKX4IN4lbCw9iDWnWuCTE4ezY37PBFBJr3b0gQkAqurjS+KmMBqb5loPZLqHrajqvhN4FukFNQs62wwnZV3lZxsiG2qBcvpkEY+IEpJCxnBT6kriEVQJadO0B+tXto+kzr2WWU3Ox8dXlLP5cjYuyF25gxWWFeoHvRpEkqOG40z3IkSdCeVlEnjbn29gtm0P2AkZDDD+BEZLUiHfPY3W7rt8jGvqnPhqTWmZmcilMEnxy4e5d0odD1ySXdiQHp9ol/Ir5n3npwpF/iewmix5iPwZdQdC/aR/PpDVnvtxCiYNV3UWqsxT0jVjPM/YhdsiZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0DkMK9E2Y92zzFttggOWfj/j0wQVPE7cKKkuqChyX8=;
 b=L/96A8gixCIqbIfShDxRO3/R8/TYP0VrCw+9O5ToeUfG6vKtphxqw/c5zhKHZdYz8x05OJm65h9t88mdUbXCaVqUhd5uMW5cMS0no7A6XREYADbfACdfRzohoOFjO0epugYN++wONjOCLw/W/C285aAVGAESfDpIWu/8QImQIGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB8939.eurprd04.prod.outlook.com (2603:10a6:20b:40a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 8 Aug
 2022 08:41:56 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%3]) with mapi id 15.20.5504.017; Mon, 8 Aug 2022
 08:41:56 +0000
Message-ID: <cd8738bd-acec-a6b9-05b5-ae8647d66793@theobroma-systems.com>
Date: Mon, 8 Aug 2022 10:41:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [docs] [PATCH] ref-manual: add definition of BB_MAX_PRESSURE
 variables
Content-Language: en-US
To: Aryaman Gupta <aryaman.gupta@windriver.com>, docs@lists.yoctoproject.org
References: <20220805192105.1970030-1-aryaman.gupta@windriver.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220805192105.1970030-1-aryaman.gupta@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0050.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::9)
 To PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b016e3e-e396-4f95-1259-08da7919d9a2
X-MS-TrafficTypeDiagnostic: AM9PR04MB8939:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p9sv3cOFvDArpNp4eS7bcMmfRAZu8Z/LgRnlKVxCmSFTJF0UGqcMQHItVxK85P7JnPU+cE2dFJgCRzuWbuCMVOC9mfY2yikdVv1AQEBaUhk2r7vsPv5A/U+uCUq4VDuovSVVbojdiosGTPwI2IZs3y9n00JoOd/xswf8ZmOy7ED4fLgY69GqUHBEaFLTQW7hwoMyNvtf8Xyoe+fWZGJbSZiXs5lJPeISwSRHqqPdzVTLE3FX5iQrvHhElEkZzyi0KxhGwSIwsIOgfZHTQPlic7siSyvbMj+eMC08KUogmA6RlpIVx3vTM4Y2V/8JmfOU61BEKr+djacCIm31ByYLUh1ABFhpiHCIi8L+B4cKBlkjraQVVz0/eZp8xmSc+MuPSssCoZgm03q8/07TPgECDJRBkNByHVWwqI7osjy9o8fndbgZs9DV3VvaBWz3HA7E2xrznBwfVppR4L5xyFmdTK5hXHxkEvym9qroUodhxgf2cBZZXQD0JmNrVY1qzd8W91VGIXenM1uBljKgVsx8v0IuTI2+cu45wUgDnPYSQFvoXxT2Na3Yj9LOhKqd1medjmLgdQUG2m/Gn8Ovi7FV0oWW1VeXbZIs0q1MYC1ljLoAk0Xyvn6yBuyd6IFKj9Sy0ysK7+CW/iQxfKJdg7ISFdn8e0QzEQTG6Vr4HEgVV9J/pIpfp0vvL4Vwl+I8wheTbyh+N+ObTQCcLF9A0ZKZ/bWZ95NV6eJd9h5R16PgoGllSXtF8NsNXmdkIMud9D4quBvUarGTgS2tNy0nFBZFHh78NEQ8DnoZh+BWaAVw7e3DRHp8bW0Fm/mRF1HRDDZmtP4GhRGe1wXzcF0jOxfjrkQhzcZY1HxsiC3H8Z4r9JQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39840400004)(136003)(376002)(396003)(346002)(38100700002)(316002)(8936002)(5660300002)(86362001)(31696002)(2616005)(66946007)(66556008)(66476007)(8676002)(53546011)(6506007)(26005)(6512007)(83380400001)(186003)(478600001)(6486002)(41300700001)(966005)(36756003)(31686004)(44832011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkMxeUE5ZnM3N1lYVjNUWjY1QWVPTlYwamdQWGRlV0UrOGhKeVhQelpsUVhj?=
 =?utf-8?B?U0ViL0UvZkQ0V3pEcVJUMmZMLzVWRzduTUJrNGJhTksrcXJzbG1VRHdUYlF6?=
 =?utf-8?B?OEpscG9vZjNQSWgwYUFxdm1CMVV6dWtMcDJiYXBUamllWEVIVVFvRE1lb2Zz?=
 =?utf-8?B?ajY0MGJTc1hYRG1hSExNQ3dkTnhzdUxQKzJRNjN3NnhPR2xxMlY1NlhkWlV0?=
 =?utf-8?B?MFdLTTdGMmx1S1JZZFdOT3VlQ1dCa1FvWllnR2JGZzNLcm5DaUJaWDBvSStC?=
 =?utf-8?B?ZFNnTWd4UzhEaUdyUnE5cjZlVWRyRWFwbE1yQ2NxelM5R1QxN1FOcWZ0czYv?=
 =?utf-8?B?WVcvVjBQMndpTEdvMWdnd1gzakg1WDJyNzRXVWZvdDA4Y3lzR2FPMGtZdEdE?=
 =?utf-8?B?U3lRajZpMS9WZ0kwWkVENlIwRko4QVN0c1dvTEdON1dCQjBMN1EzMlY5TFJq?=
 =?utf-8?B?VHZTYXk3aFllb21ZN0VYSS9DUW9zc1ZidjRYYm9pVXB4QTBzaTBxdUVTRldj?=
 =?utf-8?B?WnVRQTQ1M0cwWlNCbkFBUUN5WlNKcCtHaVNUNDluckZ1RGt3dEdTaERZa29k?=
 =?utf-8?B?eGEvOCtJY29USlhnT29aZWhlcXNxRGpLUGxhVnNlSmU4YTBmQUMyVmRKNGNJ?=
 =?utf-8?B?UERkcThwVG1GNDI5cXhDVkFqMnZkamtiZ2FKbTNQdXhnUUZJcjlUelQ0TzhG?=
 =?utf-8?B?WDFHakdzWlNmaFd0LzhidFJZNGRnZFgzaWo4ejlEbW4vSlcrSEtDRlpZYWFW?=
 =?utf-8?B?anVYMUxURlk1Z2lyNFlzNk5Ddk1jSzdNN01TZzhhMzViZDVmV0g2MVZHNTJw?=
 =?utf-8?B?Qnh2K3pZZE84cnJmYjNQZkZYZjdsWUJFcjJQaE9GN1VLWXNvaXVzdTAzZlJ4?=
 =?utf-8?B?U0NtNGd4cGNKR2V1VHkyanZab0lhK29kMzlTZ0dZUEs4NlVhcFJLL3pQVHh1?=
 =?utf-8?B?S2RSeGhTWHZGeXdwdHJFWHA2VkJrR09XdkRqSk54dHE3cEpOZ0dZamNxbTBw?=
 =?utf-8?B?MjFjYUZ0di9VcVVDZHJXdVBibkpZMHVHRG9OQWNqZ212dHRLVTVhV0phUStQ?=
 =?utf-8?B?MnRkLzN1dFNzd1I0MkZWcjBFaXpKYWRjMXFXQWdhR2dnZUp1Tm80RDBsZ1Rh?=
 =?utf-8?B?Vms5MWdTUjNKRnA3T0dXZ1E1WHF3VkFhUjQyRmpUUXlyNjBFeG1MeTVjYTJq?=
 =?utf-8?B?amFkTmgxVHZWSUcvQlNWeThoM0IrRFRiNzVMYUFPZ3dOTUxTUEJvOTlMcERC?=
 =?utf-8?B?V3VlM3JIUG1lb05RdHBmRWl5cnNyWFlja0h6NnR4VEFqQ1NDY1hXWjI0ZUZz?=
 =?utf-8?B?QmpzN2drZlZYUU1jaUNkcVYxcno4TDdsZFdBZXVSdndiVm4ybGk3ZzZGT0tu?=
 =?utf-8?B?bjhSU2pNUXVKeEtpVHlMU1NRUUlyKzJrNUxCbnlpTUJaenJMNExHbzJGVzc0?=
 =?utf-8?B?cHVZQ1ZTTE83eDU2UG5GWHlEb1R4UTRrU3B2RjJFUHVldWhnTDdkZmpJZElJ?=
 =?utf-8?B?R0ZjK2NQc00xZmN3K2tyL3F2MlF3QWZISTdnUmR6YmVEUWF3eEpiZWVNZkla?=
 =?utf-8?B?bVNIc2JnZHFkNG1mTzh3T2J0dFpXY1NoWVY4OW43NzBFMDIzcWNOSFlQakFI?=
 =?utf-8?B?NHdoNW9ucUFOODQvOUxLcHFUZGlMaHNsVFJFV3JLWFo0QkUyNW95bVZNM053?=
 =?utf-8?B?RFFIbjdyN0MwOC9YdTI4dmQ5NzcrT1NEMXl2cUVVZXo0aW02SzNyUUY4SWpo?=
 =?utf-8?B?N21JUEJYOEsybHVFbXFOdXVlMjVza1RJNXVuVWsvNExlck0vYUVrbjVEZVRT?=
 =?utf-8?B?VXFoTkdnRy94Nmp0Sk9JU0Q2VTZkUUN6ZnBFNmM0ZUh1ZStKcU5JMGRFaUti?=
 =?utf-8?B?UkRBd3JKVSs5WXVvbXJHaXplQ3AyaDVjRE1sSFByZ0xtN1YwcTM1YnZad3Ix?=
 =?utf-8?B?Yy94aXA4WHAyaDlUaG1ZeXpueGxuUFhHRUhXN1ZkZ01aVWl3Mk5CMHV3ZzVv?=
 =?utf-8?B?SS9Tbk5IdjNKNGtsdjBXQm9KT2U4TkhvbFhuUmtkaEZldlFFMmdzRXhBc1g1?=
 =?utf-8?B?d01MUXJoQ0JrNGw5OU5MYldCQnBtR0VFd2RieHErRnFxN3l6SWdNQXdOOGVC?=
 =?utf-8?B?NS9kRitPQWxScVpMNHVWclRsQ1EvOVRXM092OVpDdDdwYXRQMVJMOVIrRFkr?=
 =?utf-8?Q?rExAGaRQ+rKtAXWbBTF8F8o=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b016e3e-e396-4f95-1259-08da7919d9a2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 08:41:55.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9dU15ET+YWVmET3+irEHItIrdir07nZFJphsAoTMQQzJiGV45XIJ5EFCnu9ml3rPNWecgy8dSCSzKT1ziG9P+nsvjpQmoh9NFP2i3zBzfL47KX2pI5ZUZVGTr+A6Yb7d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8939
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Aug 2022 08:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3113

Hi Aryaman,

This is a Bitbake variable. I don't mind having it in yocto-docs but it 
needs to be in the bitbake docs. https://git.openembedded.org/bitbake/ 
is the repository to contribute to. You can cc the yocto-docs mailing 
list to this patch too.

Usually, since Bitbake only has a limited use of the variable without 
metadata from layers (e.g. oe-core/poky), the definition in Bitbake's 
glossary is a stripped down so it might not be identical.

On 8/5/22 21:21, Aryaman Gupta wrote:
> Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
> Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
> ---
>   documentation/ref-manual/variables.rst   | 73 ++++++++++++++++++++++++
>   documentation/ref-manual/varlocality.rst |  6 ++
>   2 files changed, 79 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index cf817e954..de1ff8765 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -513,6 +513,79 @@ system and gives an overview of their function and contents.
>         clean up your :term:`DL_DIR` directory by deleting any Git or other
>         source control work directories.
>   
> +   :term:`BB_PRESSURE_MAX_CPU`
> +      The threshold for maximum CPU pressure before BitBake prevents the
> +      scheduling of new tasks. Once the :term:`BB_PRESSURE_MAX_CPU` threshold
> +      is exceeded, new tasks are not started until the pressure subsides to
> +      below the threshold. If :term:`BB_PRESSURE_MAX_CPU` is not set, CPU
> +      pressure is not monitored.
> +      ::
> +
> +         BB_PRESSURE_MAX_CPU = "500"
> +
> +      A suitable value for :term:`BB_PRESSURE_MAX_CPU` can be selected by
> +      inspecting
> +      ``${``\ :term:`BUILDSTATS_BASE`\ ``}/reduced_proc_pressure/cpu.log``
> +      The format of this file looks similar to::
> +
> +         1657905652
> +         0.36 0.08 0.7 142113
> +
> +      The first line of the file is the sampling time, 1657905652 in this case.

what's the unit?

> +      The second line represents the "some" line from /proc/pressure/cpu. From
> +      this line, the last field (142113 in this case), is relevant. It
> +      represents the difference in "some total" pressure from the previous
> +      sample and is the value that is monitored by BitBake when
> +      :term:`BB_PRESSURE_MAX_CPU` is set. However, while
> +      :ref:`buildstats <ref-classes-buildstats>` samples approximately once a
> +      second, for a majority of builds BitBake schedules tasks anywhere from
> +      10-100s of times per second. Given this, a proportionally smaller value
> +      than the threshold determined via ``/reduced_proc_pressure/cpu.log``

Let's stay consistent and add ``${``\ :term:`BUILDSTATS_BASE`\ ``} to 
the path.

> +      is reasonable.
> +
> +      By looking at the distribution of values in
> +      ``/reduced_proc_pressure/cpu.log``, one can see that the pressure usually

Ditto.

> +      varies by several orders of magnitude. Currently, there is no alogrithm

s/alogrithm/algorithm/

> +      for picking a precise threshold but values lower than 100 or higher than
> +      1000 over/under regulate builds respectively.
> +
> +      More information about /proc/pressure and each of the fields logged can
> +      be found at `Pressure Stall Information
> +      <https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_latest_accounting_psi.html_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QdHPYhc7RZBxEavtSkT0klBxBznmkBy8JBZ5uQpsgmRUbeVKopN2thFZMvh_xxjh&s=Z8hAee0JuaoAoA8OVuPF5be33DcQweI6vyzVd8GUepI&e=  >`__.
> +
> +      .. note::
> +
> +         The one caveat in regulating builds using :term:`BB_PRESSURE_MAX_CPU`
> +         is that Bitbake is designed to always have 1 active task running. This
> +         means that even if the threshold is exceeded, a new task will be
> +         started if there is no other active task, potentially leading to
> +         higher pressures experienced than the value of

If I'm understanding this correctly, if the system is loaded by 
something else than Bitbake, Bitbake will still schedule one task and 
ignore the max cpu pressure?

> +         :term:`BB_PRESSURE_MAX_CPU`. Furthermore, there is some delay between

I would personally make the below paragraph its own note but that's 
personal taste.

> +         starting tasks and observing increased pressure so when large tasks
> +         start below the pressure threshold, there will often be extended
> +         periods of high pressure until the project build tools, such as make
> +         and ninja, are patched to also adhere to the pressure regulation
> +         scheme.
> +
> +   :term:`BB_PRESSURE_MAX_IO`
> +      The threshold for maximum IO pressure experienced before BitBake
> +      prevents the scheduling of new tasks. The IO pressure is regulated in the
> +      same way as :term:`BB_PRESSURE_MAX_CPU` except that
> +      ``${``\ :term:`BUILDSTATS_BASE`\ ``}/reduced_proc_pressure/io.log``
> +      can be used to gauge suitable values to use. At this point in time, experience

Was experience the word you wanted to pick or "experiment"?

> +      shows that IO pressure tends to be short-lived and regulating just the CPU can
> +      help to reduce it.
> +
> +   :term:`BB_PRESSURE_MAX_MEMORY`
> +      The threshold for maximum memory pressure experienced before BitBake
> +      prevents the scheduling of new tasks. The memory pressure is
> +      regulated in the same way as :term:`BB_PRESSURE_MAX_CPU` except that
> +      ``${``\ :term:`BUILDSTATS_BASE`\ ``}/reduced_proc_pressure/memory.log``
> +      can be used to gauge suitable values to use. Note that any memory
> +      pressure indicates that a system is being pushed beyond it's capacity. At
> +      this point in time, experience shows that memory pressure tends to be

Ditto.

> +      short-lived and regulating just the CPU can help to reduce it.
> +
>      :term:`BB_NUMBER_THREADS`

Please order alphabetically the variables. Add your new variables after 
BB_NUMBER_THREADS.

>         The maximum number of tasks BitBake should run in parallel at any one
>         time. The OpenEmbedded build system automatically configures this
> diff --git a/documentation/ref-manual/varlocality.rst b/documentation/ref-manual/varlocality.rst
> index e2c086ffa..d4d6d06ee 100644
> --- a/documentation/ref-manual/varlocality.rst
> +++ b/documentation/ref-manual/varlocality.rst
> @@ -88,6 +88,12 @@ configuration through the ``local.conf`` file.
>   
>   -  :term:`PACKAGE_CLASSES`
>   
> +-  :term:`BB_PRESSURE_MAX_CPU`
> +
> +-  :term:`BB_PRESSURE_MAX_IO`
> +
> +-  :term:`BB_PRESSURE_MAX_MEMORY`
> +

We have a leading space before the dash here it seems and this patch is 
missing it. Can you add it?

Cheers,
Quentin

