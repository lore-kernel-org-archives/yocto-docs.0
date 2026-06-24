Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE50CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:01:35 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4385.1782298888012590848
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 04:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=c24yUOX2;
 spf=pass (domain: cherry.de, ip: 52.101.72.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p83iV6cg1lef9Vr8Hr5OQOJAuKp5qk7BpoqCZHNc1C1DaesfI7KEaRljq3Rlm1gYd6hLZtfvaYHxGCuRy+/jBYITJuONyDPD4XjSwJdgxgU1KE2iHv8t8z/QoQ+cvgf7XV0wbsIr0TGCk5PkVdxoZSAj4FLXyQMvd3E78wYyd4mhYzI4dRgYdCI3EXfZksPQp75cdeQRgMrj8/0rhXSbi/EjI/r4Dl3Y022YG5V5p3AlGbv40+wbnZ6dKUJvR63xsIzATB6iz5x1y7UMCdSe+aFyh1tEWDSHbvT8rIYvNKqJ3kRtOFfMDTdyHMAuY5F5VLLbSqS+1g2jcgtXQg524g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy+1XJ2GLk8E4sdesTK43l++zBY6g1Iwi+OdEaZWZ9U=;
 b=fpLmBzyLNjrLKsCfNz7+KeknnE10992E3aU0GLGGCS1v1ZtqDFKaaclFhG+2b1iDQVZSRJFNxvlGHRf1GuiD0hNx4Il84LxtpHUqEblzOiTOj9VeZpEV1Abc/2uqwNAN5K1WMecyMJEbOjpGEEBWkt1Db/oRu/9rkST7jrFSQ0bb8yE0GLqQdJrCg+R390c6zqXjpXFHKrMNaKgLuZkEM8x5rSQcvNiy62rliP9FEOCvc0e3kT/DacToedg/CVvLN/sjkHwpz1OcO/Kdq7733ez8HIkRQmCj57g1rckZFyeT/HTN0IaHDTU7pQH4aJqgY6vpCNn66Q/nWVz1m+oKfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy+1XJ2GLk8E4sdesTK43l++zBY6g1Iwi+OdEaZWZ9U=;
 b=c24yUOX2N73Zdh93nTcabGjlYzszgUqJ53hEwtR8b89uIA8wESyIm7obHqbx+g2+5RTMouP6dI0KpOG2ubYpVeFWcZuSTxpIJ8f04gjwDDPfKQ98CFXc3e9za4jxP8phZUvI+DK8Gghe4wl6nUPuoHli346mO3DbdFZkyJI/j2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI2PR04MB10641.eurprd04.prod.outlook.com (2603:10a6:800:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 11:01:21 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 11:01:20 +0000
Message-ID: <f550e65b-d09b-4890-94f6-7fbc3a932765@cherry.de>
Date: Wed, 24 Jun 2026 13:01:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref_manual: add "fragments" and "templates"
 directories to structure
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0234.eurprd08.prod.outlook.com
 (2603:10a6:802:15::43) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI2PR04MB10641:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a76d1a-9690-4086-ca67-08ded1dfec28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|4022899009|366016|1800799024|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	INR6px45BpITS/0/wu75tJheYCcPf6QqEj/bx2L+H4qQvH8NwOfYE8Yn7x0qY8aIoxNwVc4rBJ0Br4TEYU0xB6gDiSAJNem4CGu5T3D3HNaz6Y11Dlxg0VsEgptlIpcVpQN521lR6LvAnoajzD36qhsP2TXIEFnvBd7zX+1TNbsUYw0w3aJk3JGT1ftYRcJU0cDoqUGjKuiAmwOb3RxH98b4I2mvpI0y5apmV+zZ5ZGnxktzGepVI0Uo2MXaC96pb8auJkdyV/QH3MO54pn0mhSj2d0qOKBGx/1nHqBwydlitjrd9yAltCmAfKoAi7iTj6Kn2MKTiCLjqKZACcJ9BtdWCQKZQC62eUNrCWBut45RL5HnailGbpdF5Ri/2RP4DDta/6r1Pi92totNJXLY3DY8uuYYvJ7ivA0n2powYGxvtAKAhs5Ip4rxlCm3YEGr/0XPo9/tnAxNmoPuYxIAEE8w6A9TyDe8j6Qm4jKJC1w0oG6gFHV3tQYNVl8DLrWoE+VIi/B2L1DzR6wkMjQiWBRSNOD9fmadSzlHFEJhqDEsEwFCooqcPytaRjxelSgbLi0VtmovTtfqjb3c0xp6KeL55ndkIhzDZF+R20wBEUVzjd9x4EBxZO6OJi05hSWMdwmD9IfdgL0I8C7MHY5F3BXk5DOlt3A9d0Rv0rAUPyk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(4022899009)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnZPaFhjZW4vTXcrcTlaY2JxNWJEd2NQZkVOS3dLY0FCSHIyc3A4cFNSdTdX?=
 =?utf-8?B?N09ia2UxR1ZGOWlGTkdBZmthQm5JcEhyMXNEcktuSUFDV1FIaElrb1JRVWRW?=
 =?utf-8?B?bE1zQjAzL1VKc0dxRlJQYTQ5SnBWU1FZUHRpNzRPR0xPNkp2aEtoeGcxWVJk?=
 =?utf-8?B?ZDNhVmM3ZzNWTExuR2d6d3BXblRMOUJ5UEVsL1lybW5TY1N4ZDJRZllHM1lK?=
 =?utf-8?B?NXBsTXdWbVlHOVRGQ05nWkZraDlxUTBkY2gySnpLQkd5d3pHSE5HV3BuS0lP?=
 =?utf-8?B?d1NMYnQyZDgwWDhkYkUyeFJBdkcvaVJKaEN3UTJpWk9HSHJzYjhDb1N5bkkz?=
 =?utf-8?B?WmJTQng4dXdEck4vR1g0RmozSk04MHIrc3h0c0VpUVNjODlXbmptaUVvVGRh?=
 =?utf-8?B?Y0FmTlNCNlFJQVJSY3NaRVBYUC9HK0JMNXhRVW16VXhyMUVpbGtrNlFEVDJF?=
 =?utf-8?B?Tk1FZzJNWkREbVdXMnpTeHlHUS9oWVgvY0pqVC8rLytpcExQSGovY3VEcVoz?=
 =?utf-8?B?Y0NtWENpYkF4RkxMdVNlZjVTTkRoeE5sMS9oV3RXVmM5TUh4T3M4bm1BbzE0?=
 =?utf-8?B?b0RUZ0VZcU1MTVRaRzNXSUJvZ09URjM1MWM1RVpwOU1Jakg1aDF5OHZLRTRQ?=
 =?utf-8?B?a2xtdWdrRS9EelVhaGl1cHN3c3lmM29FVTFBSVZpS2ZQNjFtdVJ3YnhlampP?=
 =?utf-8?B?U0k3c2xHY1U0cWNHVStJbHA1NkVZeGE3TnJ1N3Y3emhHZlEwTGRtZENreGVC?=
 =?utf-8?B?ODdUaXFSNlhmWlZIR25JYWZnTkN4enVxVWtWVjdJMGJFL3lWckFHWU10K2kv?=
 =?utf-8?B?Qm5DSzFJbmJueGo5b1JmTk9lYWtsZFRnRGdneElOY1cyekpGanZXcW5NNGlY?=
 =?utf-8?B?RFRnNjgvdWNtRDlzZXNrL0gzZkNTeVRTa0UwRTZSZzViVTZaVkpTbVJTbEpN?=
 =?utf-8?B?emljMmtLMVdkdnlvazhBNmZmN0g5Z1B4czBpQVpPcUxNTkFMUDU5SnQ1aktW?=
 =?utf-8?B?TlFjcWlyTGIxT2JQeWdWdW03VHJGL3p6K2JHcllxOGEyQ1VrR3I4R3pJbGMw?=
 =?utf-8?B?Q0hwSnQrOXF3YTlLakpud2pOM2ROMHIzMk1lMVZiNFQySzFtUlRaQldpTVBn?=
 =?utf-8?B?RVh3YjIrcjJDMngzMit4NUJabXgzcS9DajFPMVk3S3lJT3JnMjlJTUNIV3Z6?=
 =?utf-8?B?V3BjdlB5Y051WXZlai9VQ1hzWjZVTVhRSDVPeWhrSk1OQVpLL0NWUm9tK0JE?=
 =?utf-8?B?V2tSTjVGVWRocXBaSFl2UXlYeDRHUk50U2xydmJCZ0szdUhWaDJzRmtlbUhy?=
 =?utf-8?B?aHkvNVpCT0lsVjgxMElhY0hnaGswOGhZUmVpdnJJbitmWnBXa3ZkWGIyUGVj?=
 =?utf-8?B?SGo5UktwSHNkUGlPOUhINHovdWdlclVYZUVXQktqU2lIUjU3VFZxV1I4MEQ5?=
 =?utf-8?B?UnZOcWtxbndpemRYVnZyS2JKMWNZamF3TnFLMHBSSEhURXJOZWhxelF3OGx6?=
 =?utf-8?B?N0VaTk1YbFJ0V0YrVnR0RXVQMmpodjUrRUZ2akJFSk1iM0owYzI0TENGbmM5?=
 =?utf-8?B?NHRzL0FCNnpTU3pidzcwK3d2MzZaT3lxY1FYYTJrT2oyNHVzTVBBSjZMaUM2?=
 =?utf-8?B?eFdIeVF0NGhuQldDSnhOYmlZMnZKcmd4RUhDNDNhNzFGLzZrTmkrYlBpTU8x?=
 =?utf-8?B?SGNoaTJtNWtlYUhlb2VxVlVZYmRJeUtBalBoeHpQNTZZa2p3bE9wdUJZeXpH?=
 =?utf-8?B?eDJsWEtNNk1ObzlKYmlweWZ2eWZiWjBkRVh2UGYrc2FjamwrYW9mZlhKS0dO?=
 =?utf-8?B?bkNXOTRmV0FsY3NPSldUUDdGazF3K05OcDY5UU9mbkVBc2V5bVVQeWR1aC9R?=
 =?utf-8?B?OUs5ekVMdDI3YW9ONktrczlLMTdLU050NXkzenY1eHdUOUp0Rkx2Q09rRDk2?=
 =?utf-8?B?SFY2VUN2N0p6MHlxSFBTMHNWWUsvS09BT0o2U1VSWG9qcGRNVkg4UU5tK3gy?=
 =?utf-8?B?bVgyVTc1VGFISVdteUxhZ2hXZW12dFVMYkMwRGlJNUwzOUROMnNNbzRTYjVo?=
 =?utf-8?B?Wldvb1lPY1BzQnFjb0VMcHZ0YTl1OVoyUk4veFFnQzlyWitLY0lzSWt1TFZ2?=
 =?utf-8?B?YVJXVWd3bUZBenMwTE9tbjZpMjhJN2RxWHNTazZJOG5LeUR6ZStZZkV5YmQy?=
 =?utf-8?B?SzhpVzZ1bGVjcTdSeVgyU09OMDNNVTNoNno4bG1vdWp4VXZzR0JQV1Bjbjdi?=
 =?utf-8?B?OFRrSms4amowZ0t4UTE5K2k5NHRwQzhneUNycVAzT0l5ZGpRU0g3MkJPVld0?=
 =?utf-8?B?ZHBjYkV0UTdhNE42d0Z3Q3Jtemx3TGN2Y0V1Um1oWUF4YVVPaEVvUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a76d1a-9690-4086-ca67-08ded1dfec28
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:01:20.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4ZdDUscmMRkux5hH5xLGke/BBpD3btq+iT+d/ODVVw3TBqxj5vhHIJqoQu7TY9ORZPR9MKRc/rgi0zGJBhi7x36pBEsytzNvcMfBGBIiFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10641
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 11:01:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9862

Hi Robert,

On 6/23/26 7:43 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Add two new entries for the meta/conf/{fragments,templates}
> directories to the structure of OE-Core metadata.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>    I didn't bother with the "multiconfig" directory since all it
> contained was an empty default.conf file. So let's just go with these.
> 
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index ff84b250b..96f9c9f34 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -862,6 +862,25 @@ it is possible to extend that support to other SDK hosts by adding
>   additional configuration files in this subdirectory within another
>   layer.
> 
> +.. _structure-meta-conf-fragments:
> +
> +``meta/conf/fragments/``
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This directory contains a number of
> +:term:`configuration fragments <Configuration Fragment>` ---
> +top-level build configuration features that can be independently enabled
> +and disabled using standard tooling.
> +

What standard tooling?

> +.. _structure-meta-conf-templates:
> +
> +``meta/conf/templates/``
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This directory contains default templates to be used as initial files
> +such as ``local.conf``, ``bblayers.conf`` and other files when
> +initializing a new Yocto Project build.
> +

I wouldn't know what makes a template and what they can be used for, 
should we point at 
documentation/dev-manual/custom-template-configuration-directory.rst for 
example?

>   .. _structure-meta-files:
> 
>   ``meta/files/``
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9843): https://lists.yoctoproject.org/g/docs/message/9843
> Mute This Topic: https://lists.yoctoproject.org/mt/119945115/6293953
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


