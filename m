Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99769CCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 12:32:47 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.44])
 by mx.groups.io with SMTP id smtpd.web10.11026.1760013165809754415
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 05:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JF+2iWAg;
 spf=pass (domain: cherry.de, ip: 52.101.69.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8xqssm9Og8jpcpSqbiBdi/04MN1n3vyV37AvROFrCZcYxKbuz7RlKvFerSQ0zElTlqIoyFdCIjWQGkomRQETW2HwPI9102+4nNiavfOALXey/BlS6Bd4tFSbXYVhX89HLD3hbPZyDu+2l5twTfK0qsoAlXapaRShM/qKsChmLl+No9oxMbCZHJghmcA92fk0qx6yjw0uerQd0gcNkzfIzHmEWv6lXCx4OIe3Sn9MePu8/Fe4fCAYnDEHyX4K9HqUR8g82q0Yr3o0KkUz01rDSU+AXUKVi2yxOmA2J05mGVkAoCzxs9jCyaScbWAptHLEfgOZxhvVYwh9jQW7E753g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4AoGdX9XS3xzXOZy+DmSH36UtkEUQ0T5ko0izii3f4=;
 b=SFMeS572T8QxyBOvMfZD1kyRJF/hrBQCSV6Q8kP7dKdpdIMQzDWuKstqpgBP6uShl8I4oASDeE9uQ5NTzKtsQKdZ1blpmsTecAw1LX1sTdmXOr+952+1iACjYS2ifw8/u2N/5Oihaoctru3LtmdPH/IMHMAU5XBQbJxQIHh1a3AGEpD6TGb+bGr7brKlUU98P+aMVdTSmnJ2s8YMwpjfD1ck0GF5cJrDwv0/H62gaP81TKzAN8fO5qky37DWISqpJazimn7llp0t7Xl22xSZZJ6Ps+37U31K1USA2r/7QncWl7iKhL/1eo3l5AxLN+JNUwFoW+8c6FV4gBfjprvQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4AoGdX9XS3xzXOZy+DmSH36UtkEUQ0T5ko0izii3f4=;
 b=JF+2iWAg0++B+PkXtkihtmhc3UwIfZaJb8IpuygY3O4phcIpLAuyuwS71maefcq/lxjxmj2w9iOTQKq5GL1RThU0sKePIXpUKpyxg8GEiF8haJKtJ0lt1fqPfVjsq5bpEdPBgjWaKJ5khSNs1zaIUK1yeHPAfLnPTnGq+zgYwRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB11371.eurprd04.prod.outlook.com (2603:10a6:20b:6c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 12:32:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 12:32:42 +0000
Message-ID: <df5d5e00-f950-4e52-a6fd-b7d1cd3822b6@cherry.de>
Date: Thu, 9 Oct 2025 14:32:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] tools/build-docs-container: use CONTAINERCMD to
 append args
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251009-fix-build-docs-container-args-v1-1-169ce4248462@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251009-fix-build-docs-container-args-v1-1-169ce4248462@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB11371:EE_
X-MS-Office365-Filtering-Correlation-Id: d34475f2-989b-4a4f-b9c4-08de072ff108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dzllRzNvTzgrVDBIQ2J2WGtBQ0l5aVJ1U0R3cVZXMzdZWS9oUXcwU2ZXOEpy?=
 =?utf-8?B?bWNLQWJySUI1TjA2K1FSMWdZclcydWJ2bGNhSFYxU3QreVIvbGpxWDhCYlpv?=
 =?utf-8?B?YXNnMm5pUmIxU0xZYkVGK3NVenN6VVJySDNET2pPRVlnek1iT0NDaXF6dDFR?=
 =?utf-8?B?ekJJMGRqejRvVjNrcnhnazdSSHErbmwxOFlKTHZlWkRyVWFTbEtvU2J3UnFY?=
 =?utf-8?B?eU5hRHBXYTNXcFJtall5cUhHZTRhNXNHazMwYjBzU2Jta09rb29yMmRxOTd2?=
 =?utf-8?B?TkZ4bWNEOGFZdGpMUklsODlTS2Q1THc0NDVjYjhPMWRheG0wa1ZxdVFSUkdJ?=
 =?utf-8?B?OVdUQ1F0QSs1bGRobHB2UVJVMm90N2RlQytxNjE3Y2xIWlZpcDdLVXo0WVFC?=
 =?utf-8?B?TnFCQjZ5WjZGUVl2NU1MRmc3cndjSXU5Q3doLzBXVThKTHR1SkxuVk1KYWhx?=
 =?utf-8?B?UVZFMGVkdEFRUUpiVmFsRXJ2Z1h0WHcrT0ZmQjZ6ZlJtbzlXa2ZkOGwrNVVT?=
 =?utf-8?B?VjFaRDZFWmFtR1F6QldLa1k1V2Q1TDdBWVNGQXlvdzhUWXY3MDZhRDg2aWJL?=
 =?utf-8?B?YUQ2SEdKcFVzSUJ0UHEyS21SQ0I4RmVUc3hrcGs0bFpHR09aMGVGTjVob3NU?=
 =?utf-8?B?Nkpnc3VUakpOTkllbWJyM2trTURrclJwWnUvWjVQYmlaWG1VWEZmdUFFZGVY?=
 =?utf-8?B?VFVkT1dBOCt4eHp1MU10UW9XaU84VEtHQ0FTcCsxWDU3SGhwOVNhUUdyWHNF?=
 =?utf-8?B?UHJSb0JnQm5jd0pkVjM1VFBkcmNKYWlkTzVWODJxOCtMcDZxZStYRlpwN0RG?=
 =?utf-8?B?SCs2QXdFTGZBdjBvc1REaXY3MkFUTEUyQzdqWncvcEJRNkJ3bC90Rm0xOWQ2?=
 =?utf-8?B?eW1UNCtIQU5IdXhMMExqRkFVb0o3NjZqdUtJa3JBeHdnVFhUUXZ4VFFzdldx?=
 =?utf-8?B?VEFRbFpsWC85b2hDaExYQlQ4ZEU1dHllaFFZZ0EvNE5WK0sySXJhdUt3aXdy?=
 =?utf-8?B?MDNhZnBVSVByNkhEOVBaU3lSNVAreU1OeEtFbzIyQ1VrVnhESkFWOEx0bGox?=
 =?utf-8?B?aXpLQ1dDNkIyTlUxN0tEMktEUFpnVE5VZEJkMndJODFlRWpXMjNraG9vbWg0?=
 =?utf-8?B?eStZUmliUHVLZEJSZFRBWGxLOS9EWjVZM0s0TVptRm5OTVpNSEE3Z1hkSU5F?=
 =?utf-8?B?dy8rWERhdWxTeDFpdldzR2M2MWZ5cUo1cEx3MlZLTHMwVlhXQ3l3QXdiT0p3?=
 =?utf-8?B?bDhGSFNjYlZOd2U1bHpYaWswa1JpQmlzNVZCRFY2UFMyMzVxZUxSQVkwZUlI?=
 =?utf-8?B?VFNENTZiMVdPdGRQdzhXeGNaMWxsZmZXSkhuc3BSb0NDKy82YVp5dThhbG5C?=
 =?utf-8?B?c0FsTFQ5S2ZxZ0FZWHpCTkhueTk5dFp3TUNsNmNOTXArbWx1VURFYTJqVEI4?=
 =?utf-8?B?UHY0NjVybEhtWHN5eGViY29PaHRTSEJIZ2d2ZTFiaXNiejlMWHQwbDlQNGpx?=
 =?utf-8?B?Z05aMVg4Y0xGSXMyT2I3N0x6YzVrSmhtbkRqelBiOXBicDMxSGxtRU9EeG81?=
 =?utf-8?B?VFl0REFQT1IyeXlaVkQxZ0JPcjkrbENPS3FMV2dQbmoyd3NnUWx6UlZzLzFE?=
 =?utf-8?B?R0FybmtPNnlqdmljR0s5NWtQeHE3M1JQNHZtQ3RzUEVUS1NIV1RETnRuSWhE?=
 =?utf-8?B?bDZ3WDNXWWxTZkl6Q1VyRzA1cm80V202bzM0YmZMckQ5TzNaQ3JsZVhUVjB1?=
 =?utf-8?B?V2tDQWhpODYwaGpxSll1eWJ1S1RvTmdweUdyclJrTGtUc2ZMbHRkN0ZISEFT?=
 =?utf-8?B?bTQ3OEdJcHlCNDg5YVZDSkR1dVVUZ3gzeWNaSmdrSnZsbXd1MDBJL0M3TStj?=
 =?utf-8?B?NzgyREFkbEpxY2Z6UnRJTFQrNGFRR0ZTbkJhN2hLQUZndFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azUzd3E2T2ZaR3BrT296Tmc3MGY0Sjl0NFc5cTlQenJmU0kvUXM4WWM0NmFj?=
 =?utf-8?B?Mm5RdDNaU25yWDVWTlNSU1BUL3lIRHJQTzVLc0M2WVJOSlVRNzQvaGE3MXoz?=
 =?utf-8?B?TytDTERGLzNrdnRXdzJTRUdQSExpOHFZMnY0QWw0MUZEVVhOMnE0M0xTUmRx?=
 =?utf-8?B?eGJRL2hpTlYzQlNtTGhLM3puVTJRaVhGd3kxTTFhQ1BxNWU5YjJPZERGdTlh?=
 =?utf-8?B?N3dmbU5HMEtCaUwwcnY3aGp5RmVhVTlNWGlqTmFjNG1jNTZSU3hNUTdsdjhP?=
 =?utf-8?B?dGVLb1J2ZTZqUFJiTUNSc1dqWFdNR1NSQmtPbTFZc2E1ekR2OE4zRDJCTGZL?=
 =?utf-8?B?MWJXMGswV1NPd2FFRlE5V0psbmRwRWU0S3VlN3dlbGVmOFRpN0V1Nk5OREIz?=
 =?utf-8?B?VG1PTHMwQzVORWM1QkVQVG9kTWxpWUI3WS9LWXY3UWhWdytVVG5qckpOdm05?=
 =?utf-8?B?NEFrTGwrcUE5T0U2TG9LZzVqNCtFUzF5QjRBOFJpbmhSd2xiOTBnVldmaGRs?=
 =?utf-8?B?eFhEdG1reXM3YWxIMTNzSUhnandtQUx2QnhacnRoR2tkTzJKQnFtb2M3OUlx?=
 =?utf-8?B?MnVNTEJpVXdENVRoZTI4bmM3azJLTVR3SXIzeWhRc09MbHN4RjNQbm56Rk9u?=
 =?utf-8?B?V3pPYlQ4L01VQkhCMTZmbzZTYXg0N2xuOGowUE1ENENzMHJacHordjk2ZkVR?=
 =?utf-8?B?dnR1VTVqeDFqRWFrVUhYUEMzdmk0MWNDN2ZscnB5WldkNU51Z2o5MElTUmpv?=
 =?utf-8?B?Z0pLMzJJbW9FYktZNnNiS254Q0o3eHNKSlBRSTg4Y2U4aDhtbHc1cENPai84?=
 =?utf-8?B?ZnA0UzFHNWw0M3Z5TjQxRjFnOXBzK2VkZUs5RkZxdVp5Q2sxVmVwWWJkeFhv?=
 =?utf-8?B?TlBUelFobGVha0RqSUpnbzRlTkdBYy9UVlNMY1F0TXpuRHozeTl3Smg2Q3Ir?=
 =?utf-8?B?UisxRWpXQ3c4UExUODdGeC9qZllmNEh6NVYzam1aNnNuT0pHUjlydEpnT0xT?=
 =?utf-8?B?LzkvLzZ3ZGlxR01KY0J5cllNcU1oRzA1RkdEVjVoSHVocFNnUHBHWmRaM051?=
 =?utf-8?B?dU54QnEvbW5TaWZTaG1UVEdQMWhKdjFGVGF5ZFRsSDA2Q2twZllaMGJJaS9S?=
 =?utf-8?B?cXlCRWVQb1Q4UXVYSnBPWkpqb09adDl4STd2aVlsVmpQM0c5RmlZdFlxMHdz?=
 =?utf-8?B?M1dPZFpzc1V3Wm5VMmpLNFRXTm4vQ2p2Mkp3TlRZVU9xRHB0ekswY3dsdXZP?=
 =?utf-8?B?WG5FRDRRdnFNMGlIcTZDOGZkWkdOOEtyN2NqZThpZ2kyRFBEZVNLV05UUHVl?=
 =?utf-8?B?MzNTR2orMktpMHVXTUEzdHhoWlhYQWlWNmhRdjRNZ1BydFVCM2hyaWtoT2x2?=
 =?utf-8?B?T2U0T2RGY2lpckhwUUNJREtJdWZIeTlHdkZmdFprNVJDQjNxNFk5RHZTQVJ2?=
 =?utf-8?B?YjJBcE5VV2R1R3RXcEprbUpoTFZ1NWZkWkpPUE41TjhjQWJSNXF5Q0pmallC?=
 =?utf-8?B?ZjZsNm9FM2pBczduTXZFeHhmYW10Ukc1eDV3RGxLZ1RiT2VzMHBJRlg3VEMy?=
 =?utf-8?B?N3R0UGNCOTY2R2lxSmZKdnBxcmZTVFkvaUVhdDVLRmRMcFlXS0tlMmcyK1Rp?=
 =?utf-8?B?WkRSTUc0Z2NTemx3cm83RWhYNXpDOU1GbXdMbWxZbmtNcExmZGZLbmlzWEtj?=
 =?utf-8?B?MXU2Wm1QK3VQRHdnTk82aW9PYUIyc2FPREk3ZStYYU56YkdMRnZHOFVDSW9y?=
 =?utf-8?B?enpvdjE5VndaWm55L2J2WjAxbUQ4akZVbFpvUmtoVzh1UjZlYTY5ZTFlNS9m?=
 =?utf-8?B?eXVGZEhRQUY4M2Rodk96T243UzRVeDFhNHVCeXhXNkFHVlFhNXBmaTE3S2NI?=
 =?utf-8?B?UzhBY05MMEZZVTVHakZiYjJZRURKUXAxRk5VTUFEUDNRWHk1aEdodWxFdDdZ?=
 =?utf-8?B?bittVnFLZVVwM0NXZ1hxM3F1SERsV3krSTZwY1FUUng3NmZDelJMc1JGY0NV?=
 =?utf-8?B?dlF2NGNpQTlDdVFIR09SK2NGbFdFekpZb3ZsS0g1TFN6SGZ1WjFMTmhDYnkw?=
 =?utf-8?B?L05GY3lhdGVnU1JlN1A5NnBHNDY0RWcxT3Vhd2t5UUtmZVNtbzVFZVpGd0py?=
 =?utf-8?B?ZjBZalJBdTArbGdFRWZmUmNHem5CZzMyeVltemRmaU9TbHJXMFNOaFRSU2g0?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d34475f2-989b-4a4f-b9c4-08de072ff108
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:32:42.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXrlbVcLYJV+83srfgS3Z2Sc3yYhe8Oo7GYFV2iAy+lqu1otUKgfyMT4K1XbinQZUADQ7EeGAx7iUKRZsa9ilU23+1msCkkn8PTEc9dqtZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11371
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 12:32:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7680

Hi Antonin,

On 10/9/25 12:05 PM, Antonin Godard via lists.yoctoproject.org wrote:
> What we have is OCI = $(which $CONTAINERCMD) = /usr/bin/{docker,podman}.
> So we never pass these if conditions. Compare against CONTAINERCMD instead.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Nope, this won't work if you call the script with docker but run with 
podman. This would be the case if you have podman-docker package 
installed on fedora for example, c.f. 
https://packages.fedoraproject.org/pkgs/podman/podman-docker/.

So we do really want to test OCI I think.

A few options:
- "$(basename "$OCI")"
- if [[ "$OCI" =~ "/docker$" ]];
   elif [[ "$OCI" =~ "/podman$" ]]
   c.f. 
https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html#index-_005b_005b
- if echo "$OCI" | grep -q -w docker; then
   elif echo "$OCI" | grep -q -w podman; then

This script has worked fine for me with podman-docker script with only 
podman installed on my system, can you tell me what the issue is so 
we're sure we're fixing the issues?

Cheers,
Quentin

