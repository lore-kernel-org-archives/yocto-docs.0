Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A7AC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:31:00 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.131])
 by mx.groups.io with SMTP id smtpd.web10.10228.1709033456600427109
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 03:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=ERH1OFbH;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.131, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNH0f4IycsG+vfoToNaH2RW4lMbmLzztOrKD/EoNrKEXZWVnlpEsiWNEhzGQKL2pcf4X7WYghvgTPwRi0COkWhbtRL2j9eGzXICswbfIssHLeOc3RmpkYAMxFPmkBD4ZZ8gFFIxM/LqULAaQ1fdydPUStEqmrw5bCS0zY3VAM06s5/S7ErqYucVLrvEEbs6F5hnzduBc1uOoPu7ZNGe/o9z+aLbTgYlC/5riVQoPqpPSG4fowg/XddqIFirvxAdDLJfwAU2S4Un9llFxeAoRY7Q1xEfWhUOZ9ADqC5SPsJ3LWEugMpM7okxWdsa1isa1jlgW35OBHIWIelomxH0jfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTHCA8PPnEux39BEF8HD6574kUY0MTMs5VSd2DItUrc=;
 b=gSTrNW/W/s8+BQX8fClTekc9FYYDPaoEh378jK9/T5O/eUM79PpN0e6ykU2WxQHnz+hCpchh3g28r1yUdW/VBEUTjzC0Xt8iqR9ZgWDdSzItmLbljPDxtNtsX3kRHoOor+nmG9KSeBLBrbm/VtFgEuRVKfiogHajxdvgR3mhFZGhNn2Ut9jFqSVz5rUY/yY9alrVlyoUJyHoFZPvRQ+ghh9ajjSJxfEnCYqQW+VJ5xpQc8f+koFv0H3qmjEsi7w+7GdCPHHMhlNn0LgwNnJQL9T108PWsJiBBpImLhX9h4qgsCtYnjBF1pJNI7nZXIZSWHzze+M24p5az9IV5nlH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTHCA8PPnEux39BEF8HD6574kUY0MTMs5VSd2DItUrc=;
 b=ERH1OFbH2ZzB62xJPugyZXmmxeeVhoW3wkLHyDsZU4i3Vrt+wdkC+kFWcopNTmhDtUKUTPFzLD7e/PwE/p3QeYRTQO+n70csUt/yCCM1ic5p1jCEKNwF2DMVQmgzii8Y+i9hHTxnlhNYe2dYwjhFbh8cUFZ+g9dIdN/3QSwRmLKhVZAjfzV/ZoXxCdrptX9h7/uQhS+7Tp9uBZT15QSUojwQ14BQAffJH9PnJD0Oh45m2IOZBHRB+KWx254MWZXuKjrYcll9xi0yRJ1l2XP37IJ4ndORJ1xtuOJSCb0oKxnb8e395ng9DIkw6JXw/v8aaV+7VDNk7EJbf7Mn3ERAKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by GVXPR04MB9949.eurprd04.prod.outlook.com (2603:10a6:150:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 11:30:50 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 11:30:50 +0000
Message-ID: <d7b36e4e-2eaf-4971-a369-84b727f1cf1b@theobroma-systems.com>
Date: Tue, 27 Feb 2024 12:30:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ref-manual: tasks: do_cleansstate: recommend using
 '-f' instead for a shared sstate
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
 <20240227-clean-tasks-notes-v2-2-35fb627e9ca0@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240227-clean-tasks-notes-v2-2-35fb627e9ca0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|GVXPR04MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c6d892-04d2-4071-013c-08dc37878ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FmLfRE6KQ6XM3suNXOE5BSLQNtfAU7HtAihT8Enimtnpu0Au51ebnKt7r6FD0GLMiSeMqqoDGQy+5JkjrQWynVWBM1TJVxkDvM3SY9LhzqkVlJVjIzq/kc2bU0rE5f8ZA+JwnXxGH3fJXabzdkXSNT7/QUJjfhweqfKsQmkbc/d0Ous1xmKW6gnU9MvwQOOoIH6/dANj8sEaW5dzoHntXorogEpojYUETswVSk5RtqDu6f3IIcoqV1w6CquSYgsDOusCy17BJuY9YQMeZQ9d5gMt8BUyZS0GsglSQVWoNfAffKWXQZ3YUL39UQf3x0apwmmq7iQ/SZrgPkEiFGcQfc/eExO3b4LfmR3D1cn+XIqfyFxcKwc5F7OK9MBKKiGvN6Q7J4Z4P4xmiowhUmHtbmJa5ICOU9Y1SNui/R28EMD/IcUtxhMPdPdqqwyPFN7PoBPOgSdmusRyXAUA1xqtMvCrR2Qfdhonq7blbrMOQUPCVNnr1UuH4NKGsAeFSD90UfO0WprLOQuo/Nf5jUBUbLw/KTCV87Wxa0FGFidln6v4BfLaQdhpnmWFiOF2VmOUtZqyYkj6Uxe+asXwHYsCvqFknyjEbv1mVnym1h+YHV5V8uhyqkzB5eGOncA78xkEQK+FgBzfqKzfMuxGEhI6Zg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230473577357003)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkNaYk5QalEwWTR5TVV4dUo2VW1qLy9hV3ZIMUJyczN5TG4yUDJjZUxGWEh2?=
 =?utf-8?B?Qk1aRG9ySkxoT0d3ZHhpSVdaLzVVODRscVlzN0ljemxmSWlDRUpGQUN6K0RC?=
 =?utf-8?B?MStoSlF6Z0hMSEFUVkUweUFIUUc0UElhSVEzLzdsVTZibFhuWVF0dnFCVjdw?=
 =?utf-8?B?WHNNdy9jTTlYWm02KzJpVGVZVWdIazV5OVduL0N0TEtKSjZVVkloY0ZSNkp2?=
 =?utf-8?B?dEFYcjFvYUd4c1FJdHFoVEk2MG5UVzVMZWRmanVvdk41Z2E5cHV2K0RqU1VK?=
 =?utf-8?B?czlNZmlic0FlcWFsdUZRelJpMU10YldvRXVuUmU3QW9lODlFSGtuQ2IzTGJn?=
 =?utf-8?B?ZU5IRkNpd01VeEU3N1RvdHk0Y3YrcTYrSjNDOWhWTFFYTUMwek9jT1lGZjZ0?=
 =?utf-8?B?Z3JRbkRCeVN1VkgrRXJKT0FHaWN2dFRwVkltbkxGM1pWUUdWRWE5RHRyZy8r?=
 =?utf-8?B?cjZSNzF3d21ib2hpbGlRbkZUOHVsNmNUd2Z4RHQydHkrVWV3T243QkpieWRW?=
 =?utf-8?B?Q0hhQVphd3VxbkNoV3duOWh0aEdYdXJXdUpIKzlUTk81R0lxcWVNM3dFWStE?=
 =?utf-8?B?RnBLYjJMazVTMEhyY2Q4OEtwWUxQL29sWmc0eHBYcnJjdXNjUDJTWlhtQ1NE?=
 =?utf-8?B?WmpsMzdPRTZCemoyc2RqYndwcXFDWU1uZEpUZ0ZvS3pZbE1TTjBxTFZFcm8z?=
 =?utf-8?B?WEUwbmQyQ0kyVmFUenVKWWZFemZIbDJwcStGbUlySzRNUjJoWk8xNWlpVlhG?=
 =?utf-8?B?Tkp3VlpVVXRaZGI4bUNQRUpoaVdSakM2eHlneVJhbTN4QUNqVThHcDJWWXlZ?=
 =?utf-8?B?S3BlNmVpU2ZBVG1peFk2eHU0TmlMOVZpazJvUk94ZWJ5bGR3ajl6dytGMXBK?=
 =?utf-8?B?djBUK3llVUlsM3MrbTM2QmhnNzVyQ083bSt4bDkzOXZwajhTa0hGY0ZneUhm?=
 =?utf-8?B?N3hPV1VaQXpiY1RWUFJ2aHRIUVBoYVFjbUFlWnpuZEcwTDRMUUs5RVdzVW1L?=
 =?utf-8?B?YjN2ckZsaVR4Y25KdDkyQXV6Q0wvanlUTWhLVDFwdkZidjJBQkFIbEtPc0xJ?=
 =?utf-8?B?dTVLMGFOVTM5S3dXMUh5Z2hqb0x0ZEtYanJoeTAzcXg0eXVhWjBDQ0tkaU96?=
 =?utf-8?B?UkVqZitOaWl3dzV0a3g4NzNoeTBGWnlYMGRWSGMrODl5N3RBY055Unh0N3d3?=
 =?utf-8?B?dnlTL3ZEWUI4N0NSMzJyMHNEREhlb05PME1hL00wa0NBQmg5OENpTzBPcmVU?=
 =?utf-8?B?Z0RveGZSRThTRDRwaG9xWkt4QktrdU1vd2kxMmwvMkM2NGpUclJqTzl2alZK?=
 =?utf-8?B?M0NDcmZ3aDk5T0VXVmZwZ09ZOFNiQlc0Y0h3NllLU25RQVRVRUhma2QxRHZK?=
 =?utf-8?B?TTg3aVA4bWlvUitzR0NGUXpWcHZTS3hOalZsZFBXWVp5OE51OEtETzd4V1Av?=
 =?utf-8?B?MTU3U3ZxT0t4VXJPb1dZRGZhamhUM1YxZW9EWHdzV0Z6OXNSbmM3eUhOSXJN?=
 =?utf-8?B?MzcxYlNtcGg5c01LdWpsQUhSLzZELzhLVTk3TjZRK3MyNFYrakdTcEEzbHdQ?=
 =?utf-8?B?c3c5c3pyOGh6RlJ4MmNMTnBUc0hYcUpoTjNwVUNZdUhwN2JSWFhWck01VXYz?=
 =?utf-8?B?d0R0cnRTM1JLN2UwWnFBNG9KZ2YzUHNjRGtXNjRGbVI0a0YzRUVnMDVEam0z?=
 =?utf-8?B?SlRxcW9sNG1YbjdlK1M2bkdxQ2VRWWxPNG9lSUdJNDNhUk53STVjUXh5Z0Jn?=
 =?utf-8?B?cCs5eDlYd2F4VjBHZzFhL3FMV2JQVnp5RVpUNGcrK0xvckROVWllQSt0alhQ?=
 =?utf-8?B?TDZMTVNmc3hYL3RucDVxY1p5Tm1zNVVxM2pXWXdOM3lRNmNaOElHM29iWXYx?=
 =?utf-8?B?eGFaQXdwTjlNSHI1dkMrWC9hdFpSNllBaFoyMThsT241aXltVldpVU5tRi9a?=
 =?utf-8?B?U1FrcVhjRXEzRis3Vkw5UG5Kb3hDK0VoM095RHpKcHFZenJRL1VxTUlHU3Fp?=
 =?utf-8?B?Um9DWi9BMG95aEpRYmQvZnFPc0I5MzQ1dkNFWjJHeGFRZUtwWTFSaEV0bnNr?=
 =?utf-8?B?OTRHM3pLTmI3NDRmMnZVQnVBa3pPWmhTckxhV2h4aURPRVpHZkZWTW5FYjNW?=
 =?utf-8?B?YkJHSEdaOEd5TlFhK1FnTGI3eDd4RVFjWlRYRDdyOTNFRVZGWFAzVTJHZjV2?=
 =?utf-8?Q?xrZA3wb+QS3cfUarmTB0BZQ=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c6d892-04d2-4071-013c-08dc37878ced
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 11:30:50.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hU8FWE8uo6VPAazert3wUD7oaABFuZUrmkvKpcXJem6z05k3mh4QQrnYq8WUzLY66jf8xEJcWdHeTA2WP+CXQV2IA6A4dZiQZejmHEsJCc7+/VdRb+fTV1eCjAVkA43
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9949
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 11:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4880

Hi Luca,

On 2/27/24 11:59, Luca Ceresoli wrote:
> do_cleansstat can produce build errors when using a shared sstate cache.
> 
> Add a note to clearly discourage, provide a safe alternative (bitbake -f),
> and the rationale.
> 
> Proposed-by: Quentin Schulz  <quentin.schulz@theobroma-systems.com>
> Link: https://lore.kernel.org/yocto-docs/20240219155513.76738-1-luca.ceresoli@bootlin.com/T/#m5529687ecb0f9ec2dacddcb6ff58e2df73af9cde
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   documentation/ref-manual/tasks.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index ebaa03dc7613..9f130bb4e0c9 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -513,6 +513,18 @@ When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build syste
>   no longer uses any sstate. Consequently, building the recipe from
>   scratch is guaranteed.
>   
> +.. note::
> +
> +   Using :ref:`ref-tasks-cleansstate` with a shared sstate directory is not

I would add a :term:`SSTATE_DIR` here to highlight what we're talking about.

> +   recommended because it could trigger an error during the build of a

s/of/from/ ?

> +   separate bitbake instance. This is because the builds check sstate "up
> +   front" but download the files later, so it if is deleted in the
> +   meantime, it will cause an error but not a total failure as it will
> +   rebuild it.
> +

Is bitbake actually safe from corruption? i.e. what happens if the file 
gets removed while it's being currently downloaded by another bitbake 
instance?

Also, I would really recommend adding a similar warning in the cleanall 
target. We would have a disclaimer on the use of shared download dir but 
not on a shared sstate cache. One way to do it could be to link from the 
cleanall target to the cleansstate target telling the user to check 
other limitations that apply to both targets.

Cheers,
Quentin

