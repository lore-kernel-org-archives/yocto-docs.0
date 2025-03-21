Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B75BC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 16:22:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.64])
 by mx.groups.io with SMTP id smtpd.web10.4007.1742574136575238707
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 09:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CMUUivry;
 spf=pass (domain: cherry.de, ip: 52.101.66.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyCamw7x7E9ScqrKYFSwW3JIdKS6U09I8JBUyuNmMXU4izzfimU6JgJBlZDH3FNft5vfoDm+er6+ESpw9yo8pujAFBTnOP7HmOacOYkTMkZHwMVpQtY6+pQQPZ/OwyxtSxYYU7q/k1ug/acn/w6kH7Vv3CT5n4iY2/7ZovbqtlGUveZImexNRrRMOQNwt6srtGeZHMMzHZETYRzxVZBIc3NDG3IxmsxunfGwIpysvZFbF7HjVMCX3CPgo4qL9pE6kGbm+eCU9Y4mqMS96pP5DfXtYv2QW7Uz0DC+99YQVpoZJDSHjiVswTOM48fOPoWCUeVU5LUKpH919g9prq06rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+NYRxLU3LXQF/HkJrk28sHm/N+WXvMS6/psm+aS584=;
 b=TNvPMGiS1lsct9Bj1IrTRGVdKiLArirpXgvRRzQJKyXDOsjEWs7BuuAE1u9UwWmyLYGsEPhiQMrT1BBsczMBAPrbPyIEg5fsBJRsi5I3Q7k7LOjmnOllXRbujHyOd7ezSJHc/SFaffAAwvTnaaBo4FPDnMe2MYbvI4xPIenoTVjCRLhMl67sqRCHVYDnRzTdbHNsOlinHZoWmSuCOll+KV1N9KeWo58d/sFkN2Po1i5jZPR/X47o1CGgfrNOHoZXJfGzkaL/beHEcsAUL3NEmzVPQhHyc4jrnwyUjehzLRG/hS85N3wwNdccZGYqjoeNhiRbiR+WIdtIBAS2SHEvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+NYRxLU3LXQF/HkJrk28sHm/N+WXvMS6/psm+aS584=;
 b=CMUUivryQbq3TaghKjWrCASqGUU5C36pm+gcsddwK4XZ+T48I3+s/qoAecEvaVpl14WCteDlhLoL8fIH0Er+1s5v4ZtfNeyx4FHJlqDdTvTziWjaHvCUs+GrvQsFLCbiyeY5f/Ul2nQWZcM5kvCOKWKpmlwtld0UZtAN+Wwt4Jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 16:22:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:22:11 +0000
Message-ID: <29a6499d-22ca-44e2-bbda-2148ca6ba8b4@cherry.de>
Date: Fri, 21 Mar 2025 17:22:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbd1778-7818-4405-1de7-08dd68948891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WUFnWU50bWlNOUNCZlY2M2xwOHJqc0VCOGxGL2cxd0tTZHRSV1YrMkNRczl4?=
 =?utf-8?B?U3BTTEFuL1A1RTJSa05WRzd6OUErNGNMV2hZYlkrSEN1U0MxNXlnYTZSeE5U?=
 =?utf-8?B?YjlBUmJDQWpaZzZOQi9uVmhKVWhHVHcyWEhXNkJoK09NMFY3Kzd3Um9scjhu?=
 =?utf-8?B?ZVoyREY4a0dSWDFTbG5LUmRiNlpsRU5qWG5uejdkRUZ6NGxHTmp6Yit0Rks5?=
 =?utf-8?B?ZnVYSVZqeEZic1Z5N092MU54bnU0SkhiaU1SVWtUWlNDdndHUmZRVnFCRXNP?=
 =?utf-8?B?TUs3NDNmQnU5Y0pYY2syZ3NXY0lBaTJNTndYYXNtMU5GWHE3M2ZJeTJ0M0Uv?=
 =?utf-8?B?RXo5SjZvcm93bjB3Q3B5bWRNbkE5MGxlK01lU0drQ0lBeFJMamNNRmoraHNj?=
 =?utf-8?B?SFQ4SVNBYnpHeHlrSG0waDQvbHIrVytNRjJtWG5vSGxkdUUrNEppL0FqMlBr?=
 =?utf-8?B?bnNHUDNYNmtQUkJ3blJNM2d3NlR1dHZhZE1jQUxJY2oyZVhLUlN0SEFYNFRs?=
 =?utf-8?B?VFJEaktuN2VXcGRpRThJUjUyUTJweG1UUFhtZ0RlMy9PQ1FxUlhtSng5WjJM?=
 =?utf-8?B?a2owZXB5STdNZ3ZqQ3pXWmNXVWtuTHFxdGZsRUJOMjJseW04SXAwTFJITGVw?=
 =?utf-8?B?L2FoZC9OTTdOWkdUdGFva3pKQi9aWlR2YzA0cTZFcEhZT0V5emdjeWJxek1P?=
 =?utf-8?B?Y3FYSjNjTGs2NXpyWVQ0bWFSVEUwRWFyaXR6SXdsSFU3UVRSWTRTL29QQkJm?=
 =?utf-8?B?bVd5Tit0RHZOOTNXR3RUOHJNTmdVRkhqa3F3VUJ4WjNxc09QMUFEWkhJRGpx?=
 =?utf-8?B?T2ZXVkk0QjNSNEZSSHRlZHRNVGxlZzZldjhnNTFDOThud1RSMnpETExNS1dx?=
 =?utf-8?B?TzlJTHRzYW9vY2pZc05XU1Z2ODZwZTZ2b0RlYkt3ckFkcTNqOE1ZcmtEUTM2?=
 =?utf-8?B?YzJRRFA3WUtacG0zUG9kcTlZTnp2RFF2UXRQWlVTQ1RmaEcrSXRKU2xwaFpz?=
 =?utf-8?B?Z0pkWkV3SVZSbE5kdktEUFBnbFZPYWVnWGZyVlBidWN2UWtrMjU5UEgzckpj?=
 =?utf-8?B?RjV6T3JmNEtDTjErTU13R0dTSWMxTWZ6Um9vNzNXSjZuclFjaEN1K0pKRTl6?=
 =?utf-8?B?U050Zm9Hb2lKZytQdkJuQ1I1ZC9NdEo4UjJ1cUFxSWlIU1hEa21PRE9KV0lt?=
 =?utf-8?B?VS85UDJYZ0YySS9tQVhILzUzR1l3NG93ZkNMZFVaVk10QlVvSjNtSkxwKzE5?=
 =?utf-8?B?WS9ZazB4MlZkaGorSHFDVjVsTGJ2M0dRZ3hCdTQwTUZyL05ueU01ajZ0N0hL?=
 =?utf-8?B?VXVxS3g2dlJyZXRFejgvWjBGeUJsNnFBeE1PeitQNFdXUDE0Q3hSb2RNWnpS?=
 =?utf-8?B?TlFQV01FYzFRdkR4N1Z3L3Nydnh2N2g5NDJHNnVGbTFBYk1FWTBCRVpTNXBE?=
 =?utf-8?B?YThRY1lRalJCLzhyRXhGa1V0WHNUOTlyU0o4blBlNmsvNHk0Qld6NmpoeGhx?=
 =?utf-8?B?dmREbXhMWFFGTXZRUUFlSUVlS09oV1QrU0RZdWNHT0x1NVQvYUxMYUZ1c011?=
 =?utf-8?B?N0NLZFlxeFViYUpMWmpJVGZPSkg0V0V3OGVTcUVlYnc4c2hWT2dZbHRtTUJ4?=
 =?utf-8?B?L3EzZkJOM0o1MHRNODR1SVhpTmlTY2hzMzZyNVk3MGlONk1xYi9VNGtldWVs?=
 =?utf-8?B?VmZmbHB3b0Zta2pyZkxWek1ZSmlWWUJWUlpYek9USHBianlrOFZoeFlSMzNu?=
 =?utf-8?B?clpxOTFHUWkvTVhPTjBhZHFBdHIzQWkraTBNWWV5WHVyTVNzL0xDZTFtSm1F?=
 =?utf-8?B?OHNYMDNnRmJNdjQ5OWxKREN1ZWFOL1o3bnZqSGc4SENCSGVSTFJxQy9Odkhj?=
 =?utf-8?Q?yRFqXy+w9/O8I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGhIYjlHQXZEeTJKdzIxd09MYTZtRlBhL2JVMEIrS25DdGpHSFRQL1k2YVZw?=
 =?utf-8?B?enFnZ1JLcC9DRTJKbncvQ3pyZnBRem9tNXRnc0ZXN1htWCtUTUFpQUVoZVJo?=
 =?utf-8?B?RG5GSkVGcmZUL3MvZ2JDbHozdXBNUGlUb0dzVFVXcTV5U3lsNXU5OFN2Rkl4?=
 =?utf-8?B?ZTJ5V3FvMEVyTUpGUEVSdWhqS0VEckVUOVJTK2xidmRaYW5pQjVJcVN6cExz?=
 =?utf-8?B?M1k2MSszNS84aWo2R1FsRDIrOS8rNGpIbWVGWDJJZUJBcU9nUHF2SFYwdHdX?=
 =?utf-8?B?Kzc3amF1cjBwb0U5TzBhUlFYZExDMkcrTEovZ0w5cXpNSllIU2V0d3h3N0c1?=
 =?utf-8?B?d0c2V0FOelVhWk1kckpkZ2tBSFRWd3RtcVVxWXJEQnAvU3UxQnowNjNlamV3?=
 =?utf-8?B?d2VJdjFDbnNib1ArM2w4Y3BrMnl2T2tIc2Zibld4L1BaQ1U3V1VKYmQvZUxE?=
 =?utf-8?B?NFlYT2VCQ0dQOTB5SXlheHhPVkR1NmlxYWw2WExrdHovSW5YRU9aZkNBSWdo?=
 =?utf-8?B?dzVBSGZQOXBYQy9CQU1IZ2RXMy9rNEJueVhZNHJBK1lEdmFndEJqWDZ5MTVk?=
 =?utf-8?B?Z1JwWWJtY2llT3FMR0J2aXdHN29lQUxkd2ZFU3VSWk9uNW5weDlGQnhTUEFp?=
 =?utf-8?B?b1ZCamx1WTVIZ1JzbjFXWWpYVGhOZkUrcFFzOGZiajhGRWZzWUVmTkMrMzJu?=
 =?utf-8?B?cXdwRkI0SmMyekxHTDIyWTMzRmxqWFB2MkJmT05ia28ybk9kTVBTdWMyYWhx?=
 =?utf-8?B?MUZ3a1Rmc2ppY1M2YWY0US9Ic0lPdCtzanhoSStOVWsxR2IwYi9XSDRyNE1u?=
 =?utf-8?B?RmNlVU9nYWxUcnUvczFzZDJsd2VnMUNNeTJnd0hYSmpsdTg5RHY1QWlMaktk?=
 =?utf-8?B?WEdnemQ5a1hDRVFJaUlzdGxkUlFUV2p4WitOTGpJeml2dGlOejg2ZTcrQ29F?=
 =?utf-8?B?R0N6NkovWmlmZEJwNEpWNUdqcjBVVFNsTW1tSjJQWXVXTmI0cnU5elIrSm1v?=
 =?utf-8?B?WFdtNGNUdmNwQmxNQmFTdUZpODZhRktaT0ZZVFlvanpweC9OY1RocGtwN256?=
 =?utf-8?B?ekV2dVJidmN5ZUhaT1FjcHE5WStrNzkzV0NiL0w1T0VsYUxDVHZ1Mlg1eFI4?=
 =?utf-8?B?QWhyajVxR0NkbytNdzJCa0cyVFArUEQycUcvSk9zaVVBL1F4cGlBSDdaNXli?=
 =?utf-8?B?ZkJiMTMyRzh3Mml5MjFhZXNDR3dRbXB2Q1BrbVM4Ly9PSHV2K3RhQ1plSzJJ?=
 =?utf-8?B?WjNzd0pLM3JHaXB6d1FLd2ZUejdMbnBJSTJ2ZFVNcXpsSjl1TlpCRG9JMlhC?=
 =?utf-8?B?dFVKM21tcGgvVzVaU2NEajdJTWN4elZNcFJCUmhUbGF4QkJ3WU5wSGphaitz?=
 =?utf-8?B?YWIvaVVLUDlJT1pFZGhUcDh6d2dMc2hrL2hqNHFLd0hEbWFLYmlmWktrY2Zy?=
 =?utf-8?B?UE5xUHNYV1hwN2Z3dFN4NTBnZHEvZDVNS2prcHo4UGw5RUJvZ1BvdExNZWhy?=
 =?utf-8?B?SjgrWmVSUHlVUHp2cGpmU21qWE0vK3ZWcURwcjRqb0hLcnlUWWMvVDF6eEtL?=
 =?utf-8?B?MWV2TDVKQjlobFRzK2tNbDA4Lyt2QjB5dUpMTDVyS0FMblY0dm9PaFFucmxQ?=
 =?utf-8?B?M0dQUzlPRUtKY29CdFh0ci9NSVNORnQ4cmNmMUVRTHdzampoZ0FWVHVOWXFJ?=
 =?utf-8?B?dmI1UzY1RlpDNVRFZlh6Tnl1amxzcTNndDk1TVNZM2dDaSsxaGRYRVYwWUlq?=
 =?utf-8?B?b3RQSDNUaGtxemVNR3ZiN3IxMmJBK3ZvZVBUaFB2ZTFBSGIwYnJkQVFKbHVm?=
 =?utf-8?B?VVpWWTBGNmU3V3NVQkxyNlpkeC9RK2tDMklyMW9YTFFHUUtUY3d3SHJta0Rj?=
 =?utf-8?B?ajcyYk9sSFhObXNBbm5PcmR6T0w5UHdRaXBLUTN6cjFCZlFJaWJ5TWtGakZo?=
 =?utf-8?B?VGMzZG1NTkNBbnFLMXUrVXJmNUQ4dmhML3RxTkt2U2RGMVFmdkswZWxwOHlu?=
 =?utf-8?B?MElvaUZXRm1seFFtVXFhdUo4M29XeitlTmJHYkZCbmZNMW80YVAvWmpzYU0w?=
 =?utf-8?B?QjUvanhvS2NNdko4bzRqd0hFM25pU1UrcHQ0Z0JUR251aTEvc0ZOMEJjNURT?=
 =?utf-8?B?QUc5WXczZ1hxNU1QekhSL2N6dmhMZEp3d1k1WTE0NTlHdkdWVFJiMHpFanlJ?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbd1778-7818-4405-1de7-08dd68948891
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:22:11.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6FPwbmzFbJiq9eewd7bXcBwOhtjVfgah94BML5MaXjGlCsG6QrGdcF7wJ0nWKHgkaF2TMVfSfdTMAzKDXEJNA3lqXrTtoIAhePuQj1Xm0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 16:22:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6600

Hi Antonin,

On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
> These toolchain variables are used in a native context. Some of the
> BUILD_* variables missed documentation. Also, some of the base commands
> were also not there so document them (FC and READELF).
> 
> Some of existing BUILD_* variable documentation were missing the note
> about their usage in a native context, so add it too so that all BUILD_*
> variables are documented the same way.
> 
> [YOCTO #15719]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 107 +++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 861b04eaa..24b3f7db9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -985,6 +985,24 @@ system and gives an overview of their function and contents.
>         variable is a useful pointer in case a bug in the software being
>         built needs to be manually reported.
>   
> +   :term:`BUILD_AR`
> +      Specifies the architecture-specific archiver for the build host,
> +      derived in part from :term:`BUILD_PREFIX`::
> +
> +         BUILD_AR = "${BUILD_PREFIX}ar"
> +
> +      When building in the ``-native`` context, :term:`AR` is set to the value
> +      of this variable by default.
> +

It's not entirely clear to me from the text, but I believe we should 
only be consumer of this variable? Or the toolchain recipe/bbclass needs 
to set it accordingly, but otherwise nobody should *modify* it, right?

I don't know what an archiver is, would there be a link we could provide 
to give hints to people maybe?

Can suggest:

"""
When building a native recipe, :term:`AR` ...
"""

I would love to add a link to what a native recipe is but my grep-fu 
failed me today and couldn't find anything satisfying, do you have a 
suggestion maybe?

A user question: Should we use BUILD_AR directly? or always AR?

s/build host/:term:`Build Host`/ ?

Same remarks for other BUILD_ addition in this patch.

> +   :term:`BUILD_AS`

This is not alphabetically ordered though, since the next one is 
BUILD_ARCH, which should be before BUILD_AS.

> +      Specifies the architecture-specific assembler for the build host,
> +      derived in part from from :term:`BUILD_PREFIX`::
> +
> +         BUILD_AS = "${BUILD_PREFIX}ar"
> +
> +      When building in the ``-native`` context, :term:`AS` is set to the value
> +      of this variable by default.
> +
>      :term:`BUILD_ARCH`
>         Specifies the architecture of the build host (e.g. ``i686``). The
>         OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
> @@ -994,6 +1012,15 @@ system and gives an overview of their function and contents.
>         Specifies the architecture-specific assembler flags for the build
>         host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
>   
> +   :term:`BUILD_CC`
> +      Specifies the architecture-specific C compiler for the build host,
> +      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
> +
> +         BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
> +

This seems very gcc-specific but I cannot see the same thing for clang, 
so I guess it's fine?

[...]

>      :term:`BUILD_STRIP`
>         Specifies the command to be used to strip debugging symbols from
>         binaries produced for the build host. By default, :term:`BUILD_STRIP`
>         points to
>         ``${``\ :term:`BUILD_PREFIX`\ ``}strip``.
>   

thought: maybe have consistency with the way you expose the default 
value of the variable for the variables added in this patch?

e.g.

"""
derived in part from :term:`BUILD_PREFIX`::

          BUILD_STRIP = "${BUILD_PREFIX}strip"
"""

Cheers,
Quentin

