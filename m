Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497C0C55191
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.73])
 by mx.groups.io with SMTP id smtpd.web09.32368.1649059991192629639
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 01:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=oyeE/XgA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.73,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9b8KmAb26hBUGu+3AsWV6t0X1nO6Sj7eYvJgoOjq+fR/tFrIi1oDbkM7MjwANTLUhR/4WOg1vjQArJx55Vzb4oHWxvtZUoQLTwrIfIhwWv+JXnFFTGFgNMP6zq7wxZs7u3VhnKkCdTniEV8sTxovY/REu7oWS5hon2neorGtYgxR5K0fw0RvrJ2nAkCFrP91p1TBPu9TUNkKHeR8gw9IpvNhDsQbQshpavFJJvUuhhPNk9Sb0lRfUoDjRVfIjRw455/O1CvzZqGGxcsqwI6WBooVUg5Fmom3XzAmY0AE0fRLMqsycSOcLdQYz2tyHSfYZW8fouYlup/scEsKSagpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQOGSjZnXlozHqgVE2IApHIhhMnLtoZgnQaJD7B2Ahg=;
 b=ccDErMlKrPuM2LvjSRgFSUYhAsi6pD18t6VZoUB/noErCVYi3InTMu851E169l+3AYSGTjw2VoAbcdEAg9SloawRrb7adsFxki3rPQEcsCu4YD+KhM2ne7BgxfRkUaNdBZTsWWP3ovlYDUnE0spH8LCq7EG+lDQNseARX2PuAJxHdcq11nvqHXlPSX2LlAh+swqnjliQwXuEMt+8FA4kNpB8ERD6x0fYvgPsXHPaWjRb2Pm16Xsa8CTGLX85sgE2HC5UkoA0ajS2r4tvsIR/0VSA7brrJoOAKsFY1pkP/8BPne3JKHD+41rzdSF7OLJRUEhoqElzJB4TEa1wgNiM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQOGSjZnXlozHqgVE2IApHIhhMnLtoZgnQaJD7B2Ahg=;
 b=oyeE/XgApCPR124wWrdfwEY1G/rksSVnN+cY+ZgEkizcBOCZsBwnUulvrpmkgzaASMkmfJZnmZhec12rZaHuKgoHP7dcYceq/OqMco/FPlXlNeOAb7Ib4tso25EUeAkSzOTgqNd5DjWXfHSgsoDSpeMFywI6HoI58N9MM90SXMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR0401MB2639.eurprd04.prod.outlook.com (2603:10a6:800:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 08:13:06 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 08:13:06 +0000
Message-ID: <ba03aeb0-ffc5-7c69-50d0-0a2ec1fdf722@theobroma-systems.com>
Date: Mon, 4 Apr 2022 10:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] added precise directory for local.conf, changing
 it from local.conf to conf/local.conf
Content-Language: en-US
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
 docs@lists.yoctoproject.org
References: <20220401163649.20625-1-abongwabonalais@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220401163649.20625-1-abongwabonalais@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::11) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5964bdf5-bb13-44f0-3a7c-08da1612f277
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2639:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0401MB263905F93E3DABA2031DB335C2E59@VI1PR0401MB2639.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aQDep0516TeRKqSFldthoBJKq+ObPY88ObllZh4E08Kz9XaKpccEiwHc6kkBwGuoDb9WF2ve84f32sRRE71T3fv+OJbnNhA3lo0sz+7hEDBsjLxdJQXw2OLMeoWJfPXVEuQhsPuvMhErobP4inIEqQ59UMH5CvlvC5ZzJAkWuEDMzLQVZJoetTSDgyMqGNQvS3843KWLIO83OVp3zEURhjKH7JbgWURzUdHqS0wvJr8xxwDCGiSsF6bKXrx1hPJ5ChcWi03FMKLtjPA1mvEo5maGTfMe591tkv0OYUi0l4hTdcGtmz1ZvG+uWp9oWkcPVrOLmut+6fCwV7Du95tgjEScTldOKZ0yOHYgyFXsGkC3iyvduhyG1SVG8QBBpWwlkxWtqzL8KKmkVn4xFPdLx2Po1bNbsKG+tKSU/pLnfHNLnoPRXNb3AgkAeMY7uNQNzuv51eoF1+W+EHn5OMoy6nbW9SqQeaDXEht8bakDi3xfos5TYWNpK5n4Fhfn7/n7HO730uQX9ws1jzYd2/4bVXajzNeq3VEswh9GEpw5YNUHWD5K9KC0Y2siZ0U5pKFNMBBUm/fhi6irjalxEhCLAUVXfgK/a5AqE5Xt/za7CDhpFJC0LKE/IaAAMeOSEzjZ8gqR0oznNbwt0wZZTJa7ERWJb5ZK1aiseXujUYgXbiTQ1qjI/ViPueQcTe/Rv2VPic/3/ReRdCGbc5CRQBZWpKMk6AiN/Heg0OX7eM3w1ap1R8S2O5a6fEhVMxQ5Mt7ycyoS44n/+Vpln5qkfVS66gnpfmXSKN1V27QU/4XfD9zmvjNCKZro0KgJWWuzi9EC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(86362001)(31696002)(2906002)(2616005)(186003)(508600001)(26005)(966005)(6486002)(83380400001)(53546011)(66556008)(316002)(31686004)(36756003)(8936002)(44832011)(5660300002)(38100700002)(8676002)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDcxNjltNVFXL3VQR3hFK1V3aWJYdXV2S09yY0h3U2YyMGVHNGExQ2crd042?=
 =?utf-8?B?bTh2cGFYUktRVHhqQ0VvWGdKVmVnblhJMTJuYUdJWVVrZjFEUkhTQnJNWE85?=
 =?utf-8?B?aHZSWVVNejFLb0NMN0RGRTZKTVR3RDF3OVBzUi8yckw5dWV1TkY2TkJTOTZl?=
 =?utf-8?B?bFk0L2NHZkMyTFlVR3RIMWRqcDRRb2hvQ1FBVXk5dW80ME5lNzRzUGFRMzJt?=
 =?utf-8?B?UER4Q3RTbVNtK1RQSmZTdUpOc2RjNHRWT09YN3hFMmhjZTJQOEY3VThFUXo3?=
 =?utf-8?B?Nmx4aDhHRWY3SEIxUVl6ZnJoTTBiZFh6RHdYU2xBV0VXWTVWc2RVV3JjdlFx?=
 =?utf-8?B?bEJuOUNRNGM5NkZXMVQyOHZtUy84RG10TmlmL0RkdVo4MlRUVmdQNi9OdkQ4?=
 =?utf-8?B?TUppd2oxQ1VDZ1N3a3NtMlc1dS9VS0lVSGIwMmJKY2lzODlSOHN3dUxRVmd0?=
 =?utf-8?B?MHlBd0hRbkZJalJJNUxSMnNnWm1UUVd1cGsra1N1Q0h6U3ltNUp3UWQ0ajhL?=
 =?utf-8?B?WnkrM1NCTkxpc1p5YUxEeXN3VHZHOW55MHBORFBVN09VejluSzJFb2hld3g4?=
 =?utf-8?B?RUNaUEgvR2VtNVdZVm9xTXlxMHdiTkwvNytnWGxBZmpoL05aL2lNMlFEeEFU?=
 =?utf-8?B?L0tlV0tabTB5dEhjR0o1ZXdYOVRTRzNNREpHcXlPdGxLbkRTeHVKcTMweE5s?=
 =?utf-8?B?UmtVdmIrQ1hsYmJ1U2tKYnFLZytTTFIzNlJRY2hYVXp4UFU0VnVuMmx4YlZJ?=
 =?utf-8?B?WWVhbHZYOWg2aGp1dUdxUWNYZ2NIMm1wVXloT2lHZjBISlQreE5wZC8wdFZo?=
 =?utf-8?B?RUViM05lWFdUL0YzY2V4YVJvTHdZNForVzhSSGZaU1laTEFlQnpKQkhEQSs0?=
 =?utf-8?B?MnVGakgzcmRvSUVFVnpWVzR4NFBuSXNOc1VXMGxXMUVDRHAvOTJ4QXVTU09U?=
 =?utf-8?B?K2FpRUJBU0YrY05USWpURk1WejJYV2RobDJpZklyUDZLU1dxdm10ekl0MnhS?=
 =?utf-8?B?aWR5THFkVXNJUDlLakxIbmplaTZ3Ump2TGtCM2FUbEc0dldCSUZpM0swQnNl?=
 =?utf-8?B?bFJqckxGUXRLeVFzUDVOREZ1QVg2ejdOOC9USDgrOTUxbTdSMVVPc0tBTWtG?=
 =?utf-8?B?SWpWdVVDSDc5clRNK3FYdkxDVjI5QXJLbDh6cjRDVURGSGVYUTVnc1BjMG5q?=
 =?utf-8?B?czNSZ1NEM3E4NXVVZm1zSTQ4T05iS2lHZWJsNGZNejgzRGtJcGFpRFh5SW1O?=
 =?utf-8?B?TkQ5MHFBWlhWM0IxalRIeWpTaUg0bkdxUGN2bHFwQWF4VmpCR0FhbG1vNjFL?=
 =?utf-8?B?N0dnVmlOV0R6OWZxTDZkWXZDajduUmhId3BkYW8wL0wxek8rM2psYkJhU3Ex?=
 =?utf-8?B?cGQxZ2YvY2JYUVpQalpnZmRnQjhZaXBWaS90bGJlOUlYQ012US9BWlVMUi9T?=
 =?utf-8?B?MFpjeTV2YTZ6NEh5Q1IzSHM3QmlSb080aTNhUWZWZVZPR2pkSWJYSmQvSGVs?=
 =?utf-8?B?VUtRR1BrTmlVVExyRVdlUmZPMk90eWNkVEFjT2ZRWmRja2szU29XRWpkKzls?=
 =?utf-8?B?UVlLMkZQU0dxTzNKSEtxU1hxR2RlZFREaGc1Qm84K09EQXlGRklQdjF6ckR6?=
 =?utf-8?B?bFM2a0N6Tk01TjI5L0V6ZmpIZENRVExuTDBYQlNabDJYeHFXL1dOdG0vdzVD?=
 =?utf-8?B?dG1rMmRIeldQdTlGMWJSZ0NpVkthTXdrcXc3KzFBRlR6RitRRlFrTXRVRkly?=
 =?utf-8?B?UG40dStNZ1ZjQitNU3JhaFEyWlFEN1BnYUd6bExwWTc3dmZwMzM0ZXY0eG9t?=
 =?utf-8?B?MnNlNlNsSUc5N1ErMHN5cmdRZ1g2amw5SVpwYXgrenM1NzFWdUt4M0hNVExG?=
 =?utf-8?B?WU5kS0Q0THRKSGt4cTFOanBkeklOc2NUQ3NKaWFjSkZ6Ung4dVhjUXRzaEs4?=
 =?utf-8?B?UE82bjd3NlQyeDNTRlA4ajhXM0VYeDdpYzRkMDhkOTR5UWJHTk0xdWZ3MUdY?=
 =?utf-8?B?bGR0dXhjVWJJb2pEL3pQeWdkZE54b3VnL1U5SUc1a0FrWU4rZG9Peng2SkZI?=
 =?utf-8?B?MFNNNE1sSXBOUnUwTU13TG92c2tUYnJleFpPNU56TndNd3BNSFlSMFc0cW02?=
 =?utf-8?B?YWpMamcvSDMrTE5sYmhjU1FDR0VkVkx0SzFxdXhWSzhuM3Q5aXd4QUx1bTdJ?=
 =?utf-8?B?ZUNkT2lIZkRlUW9Nb1hIMHMrbTV0QVB4cHhJMWJoc0x0Q1VRQTBUclZ5Nkgy?=
 =?utf-8?B?TzZkY2N6TEpaNFpUbHhBcDVwRXd5OWJFUm5RS1ZvVnF2a1RpaEczTXNFanBT?=
 =?utf-8?B?OUhUMFRUUmNhNjFib3RXUDgwY3BMcy9SeEdQaWNXSVMxK2dsVlhIOS9EMXRq?=
 =?utf-8?Q?BkGSarK/cNCTux0t+n5zMFq5E65UgwiyuZEDO?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5964bdf5-bb13-44f0-3a7c-08da1612f277
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 08:13:06.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 43y8XFNFeIWlbdfV2v01KWlQPTbZKX1KwrR6+3bGQapR+vTwi+3wrEIj5kdsoTNN3YqeT/vubdOp1tZWtg0UScO3anBafk7NMscMN/8f5rRLUnw/EwuF/17BS8jDs7vV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2639
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2748

Hi Amahnui,

On 4/1/22 18:36, Abongwa Amahnui Bonalais wrote:
> ---
>   documentation/brief-yoctoprojectqs/index.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index ad5d8a950..12cab1db7 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -250,7 +250,7 @@ an entire Linux distribution, including the toolchain, from source.
>         This is relevant only when your network and the server that you use
>         can download these artifacts faster than you would be able to build them.
>   
> -      To use such mirrors, uncomment the below lines in your ``local.conf``
> +      To use such mirrors, uncomment the below lines in your ``conf/local.conf``
>         file in the :term:`Build Directory`::
>   
>            BB_SIGNATURE_HANDLER = "OEEquivHash"
> 

Thanks for the patch!

However an important piece of information is missing from your patch: 
the Developer Certificate of Origin (materialized by a Signed-off-by: 
mention in the commit log). See 
https://docs.yoctoproject.org/dev-manual/common-tasks.html#preparing-changes-for-submission 
point 3. Commit your changes. Could you please send a new version of the 
patch with your Signed-off-by added to the commit (it can be done by 
running `git commit --amend -s` (for your next commits, just always use 
`git commit -s`).
Don't forget to say it's a v2 (`git format-patch -v 2 ...`) so we know 
which patch to take and ignore.

Cheers,
Quentin

