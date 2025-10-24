Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D28BCCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 14:36:21 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.66])
 by mx.groups.io with SMTP id smtpd.web10.12691.1761316571939056976
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 07:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nt7kiMGd;
 spf=pass (domain: cherry.de, ip: 52.101.66.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3ttCM2/tIFL81PbsDHi+zQcFPzDFG70zfLB8DOlJPu22wsNauqo7Tb7Tu6UCIwOKMpzwiEDXzabQ68Ydji6KK/RN+PXOOar5B7YvVSHw6GXFZX+zkUTds1LYBp2xrfxoTb5JZd4H0QppAvKkwCSptOLFfpJfNUZC2hVdX1vId6ydOHs7ptuasA4PkxKAKI7MLAvtOdChhXYiVVt6k5K1eu799sJ6cyrN2isryleH5TRmBMx+3A9J+5FOgjjf8hiIqyBD16uGUG8eWVrEglC6QvitBhw0VBvEhwghfSBTGkJjA2MEBYrKOF5GHsY/B+l43acz4IV8OjSMhwGzBhjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLPWRlYQdOxC1e70sFH20ib9CnSzrPZYz1xzRhqOQgo=;
 b=CpRVyTQzRxBcCGZfvUsC27pRoNcMOgaWGeWsG/bakm4yHwsrYH7MaGAh2l4YA4NeJSmNoAJzQio9omG+kOKueN3+2GvHLSCMcj5d1Nj28LFTLOrmKYMGQkRpUDON1POVJ4dW/1XRE0XKGvrl+7ziGfMVJpQMgUBtrZU8ju/FFLiZ2rHsPkqsbn+ogr52i3v3f/UdXVBFBc7GtOCmRfahYpKkHSjop5KodNuRL3V+DwTnv5WXHV6cIQCMDK2DiHPmjVGbFGkh0dwsW7KcIziU3BqrGSaKP7wTFJJHfn+5YkxdmsQrYhao2iJ0k+8qmzE5QyvL4ckvc7dGMbzF278h9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLPWRlYQdOxC1e70sFH20ib9CnSzrPZYz1xzRhqOQgo=;
 b=nt7kiMGd6FNEoN/8tuUhRgu3N+e8PhZjAJRdUvf+7E5Y4h6vYds/+OKyWjZvTk3xp3PRbEpWHE2RCJ+2EbvWAznINvBBYe4jdQCVoNT3KqUIvbnqRrv3dimhCMeUyN9DNgYP1wYJBYkZ8GZcHFbbvzsBsPiEtMlk+qenK2V+s8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU7PR04MB11161.eurprd04.prod.outlook.com (2603:10a6:10:5b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:36:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:36:07 +0000
Message-ID: <256b269d-2f31-4f65-bd6a-5f5b48e6a22e@cherry.de>
Date: Fri, 24 Oct 2025 16:36:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] overview-manual/yp-intro.rst: update on-target
 packaging info
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <34f959b5-acf8-e4d8-134c-b24d8a483a99@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <34f959b5-acf8-e4d8-134c-b24d8a483a99@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU7PR04MB11161:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac6450e-a633-4849-1e4a-08de130aab21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blBienc4N2tTU1diUjZ3V2QvcTc4bE1TaUc2V3UwbHNvdEtyWWt5SlI4Uy9t?=
 =?utf-8?B?b1IvUHo1dU1neUdYai91a3dkOHNLY3pXSVZ2Q2hzZHJaZVpGd0JpaGpEYzV1?=
 =?utf-8?B?R1BQWkM1Z3ZQazhCZFhsRldVVGRDRmI1ejRqTERNQlR4UWtYOTJoc2hRQU00?=
 =?utf-8?B?amhENFV0VzBBYlpBb2hKcm01dmJ3Sll2Y2FSNVpCNzJjYXFiYnVYWnVZWFAy?=
 =?utf-8?B?WWZFMXMyQTM2cGN6aGxlZW11c0ZZRW5sdmJGaXh2QjhoaHZ6N0xKUTYvRXVO?=
 =?utf-8?B?aWNjN0I5NTdOVmdrN0JjQ3ZVMlhaL2UweXBUb0FXVDJSaVlIYmEvUG1IZUIz?=
 =?utf-8?B?RU5hQXRqdjZzRmhlbm81L0dNU3psa3VEckVkTkg0TWFLSDVNaFJIT0N0SGdS?=
 =?utf-8?B?ajIwdGovdGpzZ0VLeW9sZ21TVis1aGF3SkpHc1FjTEpGTkxxOS9WSGFXa1By?=
 =?utf-8?B?cFBOQUpHOWd1WDV2d1lSOFBIYXQxa25XNE1qMFJqSHdnaGwxcTRKeE02M3hp?=
 =?utf-8?B?cGZWRFI1dUJTdFpZNVBHUld4N0hZNHp6OU1NWGpYS0RwcjdiQndaWjUwZUN3?=
 =?utf-8?B?RXFxcm5DMmZLRmIxSXQ5TitxMVFEdmY4QmxwZ202eHFCemRERVJ5S2NtK0Nq?=
 =?utf-8?B?M3lmTGNUUWxyYWZhbXZUbWxSeFdybU5vVk5aWU1QUHd3NEJkWGllSWoweUNU?=
 =?utf-8?B?RDdyUnVsWHRIM0FWeEFlMjFrc2tpM2RGTW14U242MzhMTmYwaU93K25jcEpM?=
 =?utf-8?B?OXNXdmxYZEl0MVYzbW41REEwV0RYVGZqUks4bWI1c3dSNDdWNDM4eXRWYkd0?=
 =?utf-8?B?VHp3Rk85R1dnR21TOE5MdDZiaFk0aExhMWZuYkJkVDN6RTR3QytxdW9YOE84?=
 =?utf-8?B?VHpFdGJ4a2FvdDJ4MXYrOVcxbGw5T013OCt6a1RLaGxja1E4ajViMi9ib1Yr?=
 =?utf-8?B?emN1SGV4eFhsd2tGSGt0cFM4dFVXNGlKTmN0aXMvRXBtbC95UVppYjlkN2xE?=
 =?utf-8?B?WmFJV2hkQ2dteTNoL0loamZZbXdwdkxlT04xSjc4ejRQT1F2bSt5TWVHUW1R?=
 =?utf-8?B?VUhZTHVlVTR0ZmtFTUE3ZGlWNnFOWEpGMlJFb3BiRWlDeFNUTG10Y2dEb1Ez?=
 =?utf-8?B?RFh6YlhYcjBsclFjdUROMjM4eWd3bEF4Myt5S0FkcUc2N3BHaTJYSVFVamcy?=
 =?utf-8?B?bGljVkgvZExEN3IzVXZQWk90WTJGck5WUHQ1YzQ0Z2pEeWJmYjZtL2VySTBu?=
 =?utf-8?B?M1RHc3VyNzFWNTJZNUR3T2hJekZGaXlHWjJjVTdwNjdnVFlXbExsejFqUmJF?=
 =?utf-8?B?ZnZuZnp4L1haYUtuK1FiakVYWjdMRVZ2VUthaFlpdXNJVGEyeTlvdkNCbnla?=
 =?utf-8?B?MTBMK3p4S2M1U0dzZGJHTGVPT2ZuQy9VZktvTjhCTTNSQ3NDeEJ2YVFveDE4?=
 =?utf-8?B?RlZWN2NmUHViTXNsNlJiTU1MS2FLdTJ6UGZ5THNzUnFvRG9UZjhYQzNQcmx1?=
 =?utf-8?B?WW1hZjc0K3NqS2NsT2JmQjJZamFiRjkvZ2g3clY4bU5NYzNzZ3VFeHg4NW05?=
 =?utf-8?B?WFg3OGpsZFRibHhpWjRnb2ZEaldCMzRUQ2RxeC83K3NJWW1kd0l1SkdpbU56?=
 =?utf-8?B?eEdiak1iTCtnbDYzcVR3TWlzZTN0SXJ0MWVSMUJ5WUNsdDU5a3c5U2N2SlF1?=
 =?utf-8?B?Zlc5ZTNoSDIzcDgydnU0VmVmOUp0SWNuMzBrd1JOUkxzeDFkQnBjME1yU3dY?=
 =?utf-8?B?dWtlNlBEdHgzSGl3dXcrYkVyazY2VVBVZ3RiZWplek80NUQ0ajJ5MXd2VnlS?=
 =?utf-8?B?NndzYk9KZmZMV21jYzdFNlU3b2VsbFNJTGhiVEFrekM1VCtnQnJ5bXo2eHRn?=
 =?utf-8?B?M3dLQWFvNXdXUGQyUkdaMG1pZmlDR3BSQS9uU0tDZFRSOEIxOHViZjFNbDkz?=
 =?utf-8?Q?Rel40HkJyTfpEEgRwNXQBDqEC2X1tG3K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnAwNHpNaENIV1YyRjRiWURsZHd0YWo1QS9TTk85UjJSYVZjNWZmaWhmd3c0?=
 =?utf-8?B?UmFaMzM4ZlBvdU1JWjNWVEtpOEN1b3h5YzVKL0REa1p0Y211c2tZaktycWpY?=
 =?utf-8?B?eHVQS2xXR20wcFkyS2NaOHN1d3ZYSDJYOHhTeWNyMHVtbmhkek5RVTBOek55?=
 =?utf-8?B?Vmg0SFhEUEZMWkRsZmFaYUxMWGpFNGcrZXB2VXVCYXlHWWdUVERObTFYV0s1?=
 =?utf-8?B?UnJxYUdvdndiMFo0TVNsQkRvdFJNRFpaRXcrcDJrNTR1d3p4Q2dCVkdkbHZV?=
 =?utf-8?B?UFEwbjJtdGppWDJxZmpkbGROS1lMdnJrc3NNMVF0b0xHMUEyaVRRbGZ1bHBs?=
 =?utf-8?B?S2JvZ0I2WjFjc3BMdG9OMzZzVndHTzFvMWd6azVPdDBkM08yeDV3YlFidTRv?=
 =?utf-8?B?QXZjRUI5NGh5T1RUS1N0eVRDZ0p3SUw1WENoUWpGMWhQVS9pc25qV09YU1Er?=
 =?utf-8?B?Z09TOE1OcWF6MHVhdGhEbXZ0MVpUSGUxMjVNaHZiNHEvM081SEViYnkzQndO?=
 =?utf-8?B?Wkc4ckF2UVk0MEtUTEVSTWJQMVM5MENkQkN1ejdWa2ljeVhscHFzc0t3Q1Rr?=
 =?utf-8?B?V2ZET29hL21mZGxvRnZzb2lkK253SjRLRUJjVG1VQWF0L3prYm9zQlBiK2xp?=
 =?utf-8?B?dU9YcGFkY0tvUE1lZ21ycGh1Wk5KZG1kUTBEclExUzhOQUVsRi9qWTcrNVYx?=
 =?utf-8?B?NGY5anNUNHord1V5WU1HZElQcmdnS2l3dXp2RFM1NnVoUmIrNFlFK0NwZjV4?=
 =?utf-8?B?Y0lFNmp5c0JUc3MwQWtqcWNESFNuYXhXYWFNQktuUFVBTnBpeDN4dDNtT2Rk?=
 =?utf-8?B?N0FrcGF5NGRjM0tEZ3pqbFZjVUFtb3dpU0FzUkxEbTY3UlpzS25pQTluNW13?=
 =?utf-8?B?WGVESG12eHhEcnpKeWlEN043LzBMbytCVnNPQy9BZUhGbWY4L0x1eHk0M1BU?=
 =?utf-8?B?YjNMdSsrTU9pam5ERVpQQWk5cU9zb244ZWFINkdCS1BJV2FOL0FPaCtoYXk4?=
 =?utf-8?B?Tm9ET29sUXNMVDBJVDExV0tHMmczVEVIWlBIOTVFY0xzSUtSMXlyd3M2VCtI?=
 =?utf-8?B?Q2pMSS8vVW4vNHRyUXNUa0Y0YWR0SlBxNmpKQW1YMkhHVlEyZUw3eXpjMkpJ?=
 =?utf-8?B?QUswektaRkVGcVdEWHZDLzlJMW1obzZXbSt1WERnblVGaWNGQ2hMamN5VFFU?=
 =?utf-8?B?bi93WE1aWkpWUlBoUVBocUVrVmxSTnZSTkdNVm9QcjdXWDNzQmNXMFFpdFQ5?=
 =?utf-8?B?TTRzRDhZbUI4OCtZMnZQcjJRZ09KbnZwaUNaTUtzVVovd205dlUxc3hEam9l?=
 =?utf-8?B?ZUZ6M091bGh3MUViMDZOcks2WEZCUXlFVWMrTFRxSGJuQjVBTlE5WEt2VWZV?=
 =?utf-8?B?UVM3YkdVRVdraVArc0ZVakl5dWFGZTRiakpNU0MzNi91ZnFOcXBWNlhQcCsy?=
 =?utf-8?B?cDdudzE1b280ZHFmNWRNeGxldFpoZ0lwR0lVUFg1ODdoa3FrR2doYzV2V3JL?=
 =?utf-8?B?bVByS3ZSenFmVGdBYTZUM3NYaDNvTFh0bWROMzBlQnh0UHN3Wi9rdFVmdlhq?=
 =?utf-8?B?d0RhZGdHYzdDb29rbmhZK1k2Z2dyWjl5NXVPOUhiRXN0cXRUcXREUlZSQmJL?=
 =?utf-8?B?WURqSGt5MXhPemF3MGFubk51UjNoTCtEOEcwY3JTYkU3UzZxR1hjSWVLVWxY?=
 =?utf-8?B?dHpuODJqTWhXUlB5U0lKU1YwRjhWa3BUYk55eFJYWDhVNEVzRlArYVpSTjFm?=
 =?utf-8?B?UEI3OHBzSXR3M05GVGlLeEVaZHc4TTcwcFhnWlFqTTk1OHVRSmlLSlFaMDB0?=
 =?utf-8?B?OVpNWGVDNXQ1a2oxZUt4ZEJ6VW42ZXpJekZ2M29GNDRoaUgyRlNPNkJrV0tz?=
 =?utf-8?B?ZVNFWWVZZjk5bzZCclptUUxCZ25FRUZ2c0ZhT2JoN09IdEx1d0hza01maHA4?=
 =?utf-8?B?WElnZktYeDZhd1VvaHUxY0pxUVhqNjR2RThzVWZUY1B0dTRlVitudzBJTnpP?=
 =?utf-8?B?WFltaVMxTHNEOUNIZUZXUHVsVXF3N1ZhbSswbTFuZjNIQVg0QVJIOW1RbWs2?=
 =?utf-8?B?aS9EQi9ES044enphT2t6aFJFNDNSd0JXdnduSHhQS3RkQTlPYkwvQzR3RlhE?=
 =?utf-8?B?bUhPYStuUkx5SEpQbGpNb085TjFrMnJMYlJJQVgvbDJiWnF4QVI2VmY1aGhW?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac6450e-a633-4849-1e4a-08de130aab21
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:36:07.6640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVia3AKgFJuWD2/GR8DbQkY8NYVOBEXcree0d34WKanZ8Yto1xU8LlAOspzmXeibVBbdtNbK5U7VsO+4gCl2nda20ff8fLQFKQGVIS4muww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11161
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 14:36:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7819

Hi Robert,

On 10/24/25 1:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    - drop references to obsolete tar packaging format
>    - add references to apt and dpkg utilities for .deb packaging
>    - add reference to alternative "dnf" .rpm packaging
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 8fa17b191..1e36cc3de 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -174,11 +174,12 @@ Here are challenges you might encounter when developing using the Yocto Project:
>      changes on the development system within the BitBake environment and
>      then deploying only the updated packages to the target.
> 
> -   The Yocto Project :term:`OpenEmbedded Build System`
> -   produces packages
> -   in standard formats (i.e. RPM, DEB, IPK, and TAR). You can deploy
> -   these packages into the running system on the target by using
> -   utilities on the target such as ``rpm`` or ``ipk``.
> +   The Yocto Project :term:`OpenEmbedded Build System` produces packages
> +   in standard formats (i.e. RPM, DEB and/or IPK). If you included the
> +   runtime package management feature in your image, you can deploy

Sorry,forgot to mention that in my first mail, but if we're using 
"runtime package managemennt" maybe we can link to the appropriate 
section directly here? Something like

:ref:`runtime package management<dev-manual/packages:using runtime 
package management>`

maybe? What do you think?

In any case,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

