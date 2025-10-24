Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8303FCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 14:55:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.web11.13569.1761317720054185423
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 07:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OH7PcD58;
 spf=pass (domain: cherry.de, ip: 52.101.70.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5k8lezbwhlq+T61+dDjnUUOBOmgyIz8unh76+sToqfV6rwrluuLMiFMlGrDkffiP8IFtp5in6wiphPq8u+XsTzKOeJxJ6Nsy1aTREqTXs9f9okdMdvftlft2Bx/Z24vzpe9ecChg+XcXq5YU8Bgt1IQe72SlJAoY12FYaz+g8tqe2qm/scfth2RsyPvamu7/Hxb+XaErZvqQ9ehIsrYJlbeLiSnd9tHGPoH/FZHzbiyOtimjVtamxWji4pplqFxjtPp/8Z/7d6d4UySq5G5/5J/wXiPK65DN2qaHDqH+V9T48GA/DZ3tDw4lfR2TUl+mtRwIg1CO2fEpMZVeyCaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR9SoZZKfd2KM8qBaIJblB/yxH22kV+fHYsDOW7rCwk=;
 b=enbaMXCxZHNcM3MuXLvtYXZKvPhPGqMAOYpO5T6XiBGmDjEKJ3YrwA0qPSrZBm/+ofYswxCZy89oCyuAMu9yqqB5oUysCuAMCzFuab7WHQMvKLA/4c3D1rocBeGdiK/cy6WD1qWwuV5eLx25roahi1NkLi2JZwuGuex2BA7bG9Pw8XBvOX0gEuvTUXKn4SAs5nPYMX5sSRHSvq+/vcvLvNEr3C/5vwm0/iOOKHvMybszBXd/a3FtLHp97WjaWjf6IUGyxBzhXMNbAbjgf6to8pLZbEWl7Et40fjDwHR2I4TD8RQYRtpjWw70ob6pFDo8ubEuQUthYKM98nN8juC+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR9SoZZKfd2KM8qBaIJblB/yxH22kV+fHYsDOW7rCwk=;
 b=OH7PcD58hkQUEEpCn9fGFJqz++OYxo0SVxxV9ETkEYiQwoqRDcZNJ3YGatp/v7jViPwLlOM1YLVUAZtU/7EV2AeZFhrSlYC2yReo4UIWbfIJ7z66Tt8VrucJ+n4n9OCLKNTg2qIzPqH6VRCmRyPVCxpGtfbQdtnvHMQJwC/wLhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8831.eurprd04.prod.outlook.com (2603:10a6:102:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:55:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:55:16 +0000
Message-ID: <c5be1417-8853-4cd7-8d45-1a85ba1f3e99@cherry.de>
Date: Fri, 24 Oct 2025 16:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/2] ref-manual/variables.rst: document
 IMAGE_EXTRA_PARTITION_FILES
To: pierre-loup.gosse@smile.fr, docs@lists.yoctoproject.org
References: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8482ae-768e-407c-4673-08de130d57c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1pDa3crd3VzQXlwTmJsTnpqaXpPbXY3b3YydkFSOFpJOXEvWnoyRys0RXFC?=
 =?utf-8?B?NEd2YmFhL2xGemVRME5IczdONzl2c3NyMEVNYkEzWGhFNHRSTjVwVHpNbFhh?=
 =?utf-8?B?UldGNENzSjNHK0JmdGd6aUZxZ2ZIZ0tTY2Nwb1pBOVpzVnpRRnM0L1kxSmlD?=
 =?utf-8?B?NVlsNHgvelN6c1JhSzZqWEorNS9VaWZIMEQwNTRidjkzanRLa2tuUXBwZXc5?=
 =?utf-8?B?c0Zrb0lMRU1Sc1V3WGE2NUV1UDFvYjRtL1orc3hpVkVwU3F2RmhCa3c5T2Jn?=
 =?utf-8?B?cDh5dUpOZ0VZMmhWLzlTVmwxWXZKVmlzK3V4R1N3OWxPTEl3Mm1MeUFzR2xr?=
 =?utf-8?B?cE94aDNTbG0wMXFkUGJoVFRwS3ZoNGhqajFnT1FROCtSMk8yS1g2azVIOWhP?=
 =?utf-8?B?Sis4blFqSzFnZHd1djhQS2Z4NStIL0V5V1g2WWRFdzdrUWtUZjZsNEZGSzRa?=
 =?utf-8?B?Z1IxUU9hWU9NSEtLdGkwcFVYNmpmWGJiaUl5cWpRWDlYYXdBZjRNR21BUlcx?=
 =?utf-8?B?QVc3dVo4ZncyeEJ3VjA4R1ZtcXBMdmpDNm92R0ZKMFVDUmhrVWRpNEdDM1d3?=
 =?utf-8?B?TWVjRHQwRzZ3bWoxWGtIT3g4N3p0ZmQ5ZG9uaWFrS2gyUW9MZVJFRjRQcG5K?=
 =?utf-8?B?V29xL0Z2WXN1ei9MZG9FV3F0SENNVmFDeXlSVXhEcWdEQXU1ZitzUU1COHdG?=
 =?utf-8?B?ZzUzaUFuSm9EK1ljbmM1VFVjaGVOLzhhVGc1WktoOUQ0dUQwbkN1R01XL1hX?=
 =?utf-8?B?UDdac1R5THR6Y3dZODJrWUQ0MmF2Tm1RcVNzYzljT3dpU0VDTklkdlpkbTY0?=
 =?utf-8?B?dHpMVnFtcXN4QzFuVE43MDF5TnlFQ2dpOUdOUjFlYkdIK0k2YU1iUlYxTFBk?=
 =?utf-8?B?c2xBMDRqdXY3K3A5S05SYi9DMzhoZ3NZalZlY3crazNvazdBWU9kSWY4RktO?=
 =?utf-8?B?RFpveVdyeGwvQmdyMU14NXduQ2x4RkNrWU80dndkSk0wMi9pWVNMcUJBMUFC?=
 =?utf-8?B?THZPVU1LSnloeVdkZy92am9VMzZmWEUzVEV5Mkg1NDI1QlVVT0J5bTNOS0pR?=
 =?utf-8?B?b0duc3Z0MU9GNXZSaE0xZmdBdDh6Y2hwL3RWNmdHcEk5MjVMd0x6VTExTG43?=
 =?utf-8?B?aEFDK09GWGE5K3JSRkgydkc3NWNCaXZuMitTK2hWM3U2cGJXNDFaclNqeFZx?=
 =?utf-8?B?ekt6ZFBYcko4MTM2L3pZQk81TGJLT2RqMW1HNW5XLzc4bWxvMmRWSExYaXBE?=
 =?utf-8?B?OThLWEptcnhscHRNdHhqYUc4RkptR0lITHRaNDIyKzM5dXExZHZwZlVUclRS?=
 =?utf-8?B?ajRQSGJKZFdRWkxrVmkra2IyQTdhK21HWUV0dG1aeW5sWXFSMkFXNmtyM1ds?=
 =?utf-8?B?UUpzcUdMY004SW0yTmlPTzcyN1pxUFlqaG0vVGdUbktXNlVNTXcwRWk3RGM2?=
 =?utf-8?B?UDlIU09qN2R0eEpHZE0vOTkvR2lwRlVYbzc5UEhKTEwvRXZWTkFOd2QxajZW?=
 =?utf-8?B?eDV3VTAwZ2dmUWVuTSs0ZXpST1doZllhY1dxU0wvQi80dytSTmQwNTE5VW9I?=
 =?utf-8?B?cGp0ZTIvR0VQTm50OSswTVBuNG40ckt3M2owbWdXNUtUTUE0bVZoVzdUOXdY?=
 =?utf-8?B?c0dvM0I4Ym5VQ0kzUHp3QnJDNjVpS0hjbGV4QUhRWHBHRFh1a1pvemtWYlht?=
 =?utf-8?B?b1VtS3RwYUhuVmNkUVFyZzk1T3JCNC9xZkhVeXFIMnFKcC9oUWsvSitVNUpJ?=
 =?utf-8?B?aGlQTGlJWXViT05mSSswL3FLaHZDcnBEUURCazVkOUVtaENVd2tzNmNuL0Jh?=
 =?utf-8?B?QjQzL1JkNDMzNVFGSGJZN2lEQzI3SXVBSTEyRlc3NlJIZmp1VFkzaVpSK2lk?=
 =?utf-8?B?VzZRcG5tYlJPTldaTXF5Ujd6RDlvMkNsbXhGSmVybHVVNUJCQ2N5c3MxcVpP?=
 =?utf-8?Q?gGf9dxscKmudU/7JAHV7nC3ttPOgmg7f?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTFTTmIxV3d0bFhRQ3U5Q1Q4RC9uczFUUGM0Yndnbm5sNFNSalo4TDcrYkY4?=
 =?utf-8?B?cDNiajh1Q0pJbFY4UGRDUkFGMGp2dGh2OXpQRUNzR0RLZlJPTE5iSlZJcVpn?=
 =?utf-8?B?YnpITnpIcjhQMENBcGdNdXNQdXN3VXhKOWF6eHIxRXYzc3ZNNWxjS09FeFEr?=
 =?utf-8?B?VnRMbXVNODNnVUY1anl3dllQM0sxd2xOY2dYTytVUjMzU3lXRXlZMXh1a2t1?=
 =?utf-8?B?TmJNdmRrbnd4cjBuZjRrek9sWWhrQy9mQy95NTdTZFBpWlhPVHVWeGFycS9N?=
 =?utf-8?B?bGh3S21kdUlxQnBNRkMzYzMrbFpXdXJ5c3RHK2ZvUkNhUHI1TC9sdGZpbjVB?=
 =?utf-8?B?M2NKNWhjQ05pNEZGSGFZbzN6dElQSkJpRlhMSmJ4cjlLVFVBMEptNDl0SUdT?=
 =?utf-8?B?TGRGczJISkVXMk1XNkxOVit6MzlPOU14d203WkFzUUJnNm5VRVpXWUhnNCtQ?=
 =?utf-8?B?VFRpY3dsUnJ6dDNzb0tMWXlYMWlRNFRvUGNFOHYwUzZFSXdvT3F4RW1McHpw?=
 =?utf-8?B?OXREQ1Vnb2QzUmpQZ0Y1dStmUlR4Ty9WeVZSa080MXdtSnRpVnpkMEZ2QkZM?=
 =?utf-8?B?MHUra093Rm1CYnQ3N2NoK0dwT0ZQdHlyWTc5Z0ZYNVFyV3BzV0dybmJrNTV1?=
 =?utf-8?B?WEgxTHhpL0M2SVV0Um5ySDBkRDBvQUpFeDNWMU5hcWFGM3VMZ2dPTW9ZQUo2?=
 =?utf-8?B?RVZ4azFWd0M5OEkra2ZuZTBpWmJXVHpOV2hScEgwVWVPdUt6Q3BMSHpEMVk4?=
 =?utf-8?B?dkxxUkxzNlNQWTBEbUVraHNrbjlYR0dRM3VNa1g4ZGFRYVBYTmJpQWlqd3NT?=
 =?utf-8?B?UitmVzk3U3JVVm5jaUJBY1lnMXh5MW4yajJCTkhxSVoxWndzQXBmVjFGODJp?=
 =?utf-8?B?SWtreHhHcU1yWTF2ZGF3a3ptTzFLMXMyWnZFUEJ1dGZGUWlwZ25CcDdYeVVv?=
 =?utf-8?B?bFFBamw3ZVZ3b3prY090a2J5TkxJQWpPdU8zZWR2UkhkeVB3UG9RdmY1dGZu?=
 =?utf-8?B?em0rUXZlc2RVaXpXRVJ6L2FCMiticFFWNE00a2YrOTJpd2x2MmxyeVBpLzh2?=
 =?utf-8?B?ZTB4OXFuMEoycTNSRUVjb0RwaWpucGxFaS9RRSs2MjR2WlRKQkJUcDNLRmNM?=
 =?utf-8?B?OUJmcG53R2hDK1N1dEZ3ZnJKSlBnUURFMDVMb3JhdnJEV0QwaEpBT090MlFI?=
 =?utf-8?B?b0QzMDN2NmdRYmt3Rys1bUVtNi9JTjFnNEVVR2pmSzBCWU92SUFCdXdxeUhW?=
 =?utf-8?B?a3VLUGN2TjhwaVI2VmptUndWd2d0UEJzVHVmWmdzSkR5OGd0c2dubFdZUXNx?=
 =?utf-8?B?NkUxZ0MvamcrdU9HTkd2dGswVUhhOXpzeithK0N5MGVxaGxBdUNrcFkvQjUz?=
 =?utf-8?B?UnpZYnhML2plcHNPYS9MWjRqMkkwRGZJc0xubm9IYWUrUmZDdkF1WElFTlMv?=
 =?utf-8?B?WGp6c0NSajRjN3Y3bXZVWVU2ZXpnWjY3MlVEcTlIUGxHMDhsUDl1cnIzNGlP?=
 =?utf-8?B?LzhnZkk4c2c2NW1maTgyNEJEc2hGVGFYNWlCQm14a3RXY0Z0NlBmVXAyQlJZ?=
 =?utf-8?B?d2ZqeWc2OXZXcDFyZzdGWU1PQmFvSVREUWFHQWNrNWpuejVyV001ZkV1NTI4?=
 =?utf-8?B?YlhrRnJ0eUh2SmpvaFA3Y2Y4RWpGVVVpN2JBSnhXaXRCY3VUWTFzaEp0RDh4?=
 =?utf-8?B?VzVoNlJOYXhVQmhPOHExUzRjVFpRTHc3WVZBMzk1T1owTnVsL0FiK0NzS29T?=
 =?utf-8?B?ZnZYTytPbUQ3SWxWMFJWQzlIYTZZTEZCQnkrRFkwejF2MDJXalF6ZkNFWFNG?=
 =?utf-8?B?QVFPZ1B6RkdEYk1sbDVURHN6Z1RQRzBuYzVLQU1zbzF3cXJWdnYyNzVBZVpv?=
 =?utf-8?B?SHRZdGFBcHZTT2VIYUllOXZpQU0vOWlPalk3bzIraWtoc0xLM095M3MrVkJN?=
 =?utf-8?B?Qyt6ZVNjbUxvWEpvUlBiNTkzUTZnQWQzZzdXVTZaUkVic1B5N0J1THpRdzEv?=
 =?utf-8?B?KzNzdzhaU1VBd3dzcFNWSng1MXlTZm5ENHlHQVRoWFRJZHdVZUYzWjVsR3Jx?=
 =?utf-8?B?djdUYnZyTVFzeU5xdmhxZDJUaFRlMHhkM2pCSksxYktkM2ZUSFRZUFNnaDk4?=
 =?utf-8?B?Q2s2SFdHZUJTaTdQWCtBYXdEQU5xMlRqdmJWZ1NsbVJHWXJyU0N4KzlhQXps?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8482ae-768e-407c-4673-08de130d57c1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:55:16.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJJEbbwn+waCJglMeJoOI+F5zg9GK89bDXRAbgSjQEdaBw0CrQV6xb0cWnR9op9oVS4pu/F5nmX7ylVV4gJ2q4j8TKCKPBa3/Gh+SEKTUEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8831
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 14:55:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7821

Hi Pierre-loup,

Only nitpicks below, check with Antonin if there's a need to send 
another version just for that.

On 10/24/25 10:44 AM, Pierre-loup GOSSE via lists.yoctoproject.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> 
> Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.
> 
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
> changes in v2:
> - apply suggested changes
> 
> changes in v3:
> - rename example filenames for clarity
> - specify that hidden files are ignored and that the glob pattern is non-recursive
> - change 'partname' with 'partition name'
> - expand the last example
> ---
>   documentation/ref-manual/variables.rst | 61 ++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 591c03028..a608a61f2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3956,6 +3956,67 @@ system and gives an overview of their function and contents.
>         material for Wic is located in the
>         ":doc:`/ref-manual/kickstart`" chapter.
>   
> +   :term:`IMAGE_EXTRA_PARTITION_FILES`
> +      A space-separated list of files installed into the extra partition(s)
> +      when preparing an image using the Wic tool with the
> +      ``extra_partition`` source plugin. By default,
> +      the files are

Odd line wrapping?

> +      installed under the same name as the source files. To change the
> +      installed name, separate it from the original name with a semi-colon
> +      (;). Source files need to be located in

Maybe we should use
(``;``)
here.

> +      :term:`DEPLOY_DIR_IMAGE`. Here is an

Unnecessary newline here I believe as well?

> +      example::
> +
> +         IMAGE_EXTRA_PARTITION_FILES = "foobar file.conf;config"
> +
> +      In the above example, the file ``foobar`` is installed with its original name
> +      ``foobar``, while the file ``file.conf`` is installed and renamed to ``config``.
> +
> +      Alternatively, source files can be picked up using a glob pattern.
> +      However, hidden files are ignored, and the pattern is non-recursive
> +      (subdirectories are ignored).
> +      The destination file will have the same name as the base
> +      name of the source file path. To install files into a renamed directory
> +      within the target location, pass its name after a semi-colon (;).

Same remark as above.

> +      Here are two examples::
> +
> +         IMAGE_EXTRA_PARTITION_FILES = "foo/*"
> +         IMAGE_EXTRA_PARTITION_FILES = "foo/*;bar/"
> +
> +      The first line in this example> +      installs all files from ``foo`` directory

Odd line wrapping?

> +      into the root of the target partition. The second line in this example installs
> +      the same files into a ``bar`` directory within the target partition.
> +      The ``bar/`` directory is automatically created if it does not exist.
> +
> +      You can also specify the target by label, UUID or partition name if multiple
> +      extra partitions coexist. Let's take the following example. This would be
> +      the WKS file for the image currently being built::
> +
> +         part --source extra_partition --fstype=ext4 --label foo
> +         part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
> +         part --source extra_partition --fstype=ext4 --part-name config
> +
> +      And the following configuration::
> +
> +         IMAGE_EXTRA_PARTITION_FILES_label-foo = "foo/*"
> +         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
> +         IMAGE_EXTRA_PARTITION_FILES_part-name-config = "config"
> +
> +      Then:
> +
> +      - The partition labeled foo would get all files from the ``foo`` directory.
> +

Replace the first foo with ``foo``

> +      - The partition whose UUID is e7d0824e-cda3-4bed-9f54-9ef5312d105d would get all files from the ``foo`` directory, installed into a ``bar`` directory.

Tick quote the UUID

> +
> +      - The partition named config would get the file ``config``.
> +

Tick quote the partition name config

Looking good otherwise, thus

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

