Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF21CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:33:21 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.web10.14397.1761319998857610507
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TdJvA2A6;
 spf=pass (domain: cherry.de, ip: 52.101.69.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Koxu9MIjgu3y9ryG0AIShv6XdhVPIECEQR8Pex4WDVOFwP6icxaelsqt3CaUT1CjI/AbwBCgAxXrNgghfjMVk4CR4MWizvXo9B43pDlseSzkv1hg6qbhsAt+D+/W9wnrbuOoe2KYsjc+p7xpS8ZpbjaAET7l+oNfDf8x9bWC6pOH7bh7nxpUxyGtBgp2AMQXkhCCCZq051Q6WyZHDLpoezJNwonXPjt702YR36Wm1haXDdsxkwYSqXJ0FfRSpEzJYmxfWmbm0OPR4ERAru+trQy4YHUtFP9TMNVhw7z6zLHZALUs8Yff2TSVaClnUkX2EBek0n9batkfiIb1FVZy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5fzOxrExu+1F0Gg4LC+21+jrDcbR72JIR+LNTJ61ug=;
 b=teExHKz+sM5lXgvkEe+zPjKb0m1eAQS/7KyY05HkwQg4/jl9F6DI2U3A6KJ5/4px4H0XBcs8RV2RYqVMVsSkwdtjir0Xr0modDK/x+1vv7yrlPdWY+vtC5Z3U+pnx4IDuGkXTJ/XGEfa0RhCuZnYBSkFRPwiTsBmd2I1/ZxPSjLxPIgCXOE67P8CeP6jEpRk07fVCIg9LnJgEw717AoWKGhImsPEf/LSVpeBRx+Z8xiQn0nMgc8QMMA5cwz/Sq5me8jv9gcMkWOjrWnIul1YD0gxg5C+GGaGh7JdepXs7X7Csl+q/etXQGbdHy9C6slScl1aLo0c9Qo725vteDcCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5fzOxrExu+1F0Gg4LC+21+jrDcbR72JIR+LNTJ61ug=;
 b=TdJvA2A6xmjm+mJLXz8ZvpOwvd34ZdcoIDXk/fw+R+nv2aEfwNbxMlpnecSgcmiK0ubIWe7DJ3dNskr5t8/k5xOxbtVi5MMSa8eitNwetxcELeWWNBnZu4zwklP4g76w/8vvRVjAYzI6lB+PtZt7d4oObvDX/UioE0nepl89rWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10853.eurprd04.prod.outlook.com (2603:10a6:800:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:33:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:33:15 +0000
Message-ID: <ff63d2bb-b7c7-4316-863f-173dd061c522@cherry.de>
Date: Fri, 24 Oct 2025 17:33:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 10/16] ref-manual/variables.rst: document the
 USE_NLS variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-10-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-10-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10853:EE_
X-MS-Office365-Filtering-Correlation-Id: 939dc6dc-8258-499a-798c-08de1312a653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czNPNTBxMUlteUZGYndSTHNJTmhodG9kMGp4bkh1aE81czN5bHdCdVQ1Mm1V?=
 =?utf-8?B?dUVwS1o5a1VPUEZzK3RObEIzemdscThwcjVIZXFQeCtZQmhMZkFxRy9ldFpN?=
 =?utf-8?B?bVRBTWJqRE1YZXlJdlo5a2dhWVlyVDhFMU9xd0xSQWlaKzVVclp1U081c0g1?=
 =?utf-8?B?eDU1UzJWTHc0WU9QMlFXR0o4QkwyQTZISkl0cGFXWnJPRUtaNTFUSmY3REwr?=
 =?utf-8?B?cWZuZmFqUTg2ZmNPblhCUXI4WXdJRFQ5SmtKL0xyNWNVSncrSmQvNGVDbzlo?=
 =?utf-8?B?QkVoN2NsVUpyMGc3RHFCWTJvNGxBcmNEc2lTTXp6MXZ4YmJhVkI2cmFiVUU1?=
 =?utf-8?B?QlpKOTYzejZDWjhLYW1oSEd6YmpubkM5SlNJVE90ZHhaWG1Ta3ZLcURpWmU1?=
 =?utf-8?B?YVZzbXVoYW4ybXZpMnZ5UkE3RmY5aGswdG5rbXBIYmVUZStOLzUyUmkzZ0di?=
 =?utf-8?B?cklqWEs0UW4yZTgwNkVhYlNlWlZ6bnZxQ2pwQWQ1Z21HaElEZ2psTlZJVkMz?=
 =?utf-8?B?SjAyM0ZveFU0MkloZzJybFlxejA2TGw2dHJmaGlXS2pEbmhuV2UycTBhWnZn?=
 =?utf-8?B?czhJTmlIdGFBQ0JuWmdHb0IwU3ZDNHpHclZLdzgrV1phTUd0a0N1Q1dYUUlu?=
 =?utf-8?B?akNXNENwYU0yMHlsVlJETTZvTmt5aVhtZ1h5cEcwMmxJZ1pjRWNFN3IyMmlt?=
 =?utf-8?B?bWNJVEgyYTZGVDF5QVdpWkpINXpVNjA5SVFSMGtCOWE5OE5xNjZta09uMjFY?=
 =?utf-8?B?Z0ZWNDlsajF1N0NUaFZHYnFnc0szdnBsaVlHcXg0ZGxZMiswb1FqMzN1Slhy?=
 =?utf-8?B?VlN5ajVnSG5wMTdyZ2xzRzhqWld5Zi9qb2dJNWI4UlVLQkI2QklRb0FDZDJw?=
 =?utf-8?B?ZkFJc1puSmFPTFQ1VTloM2VDeDRLWkF3ajlEM3hwOGppT3RCTnZTWGJ2THBq?=
 =?utf-8?B?NkV0SUEwQk1GeVVsbzkrdVNzdEFhdVBkeUp0cUpMZVJ0Y3UzbTdENUxSbklo?=
 =?utf-8?B?SUI1dFpxR0pGWUZPdlU2N3NSM20yK0g2WktmM1Y2TUR1bW5USGpvZmxZaWlZ?=
 =?utf-8?B?OS9vSHR1Yi9TN3l5QzR4Yk9VbnpLVHlWNlR2WlVKRUNFUGtPUm9tT0M0WVln?=
 =?utf-8?B?SThJajQ1V01Dczh1YzBZYnZ5am9CZ2lGdERra1ZyTmppM3BkRmlPeWFVREdJ?=
 =?utf-8?B?SzljQTBHVXlWbzdiZ0NHR0lFQU8xeWx2YVFWZlBNb25UOFRyR0hWaHNBWWJD?=
 =?utf-8?B?K214SVp0TmdkaE5wNkRXd3VOS3IwYytmV3BTK0RMaXAwUmprb2Zwa2VXSDJG?=
 =?utf-8?B?SjBnYVlocjJldjNNK1d1UzY0cmViRHRnaXBkTE9DdVR1ZHN3a0g2WGp1dWJr?=
 =?utf-8?B?OEhCUjRaZEY4cmRiakJVOVlxa1BjSG5CcTlJNDdrbUJZcVE4ZWV4cDZid3d5?=
 =?utf-8?B?TXpadVdWUGJYZDk0YmEwYkpKUFhNYkF6THIzaHlITVpKMTBMMG5wdm1lREFB?=
 =?utf-8?B?WVRGM0ViaFkwak1nOFJ0YjFEZHByYTBzRDM3K09TWGhWZEJtQUpJZ2tNbEdV?=
 =?utf-8?B?T0pHbE5uVVlkWVUvNktBM3pkVFZzWm5xZmxYQXpDaDlkSElFOFkySGNwWDRE?=
 =?utf-8?B?UzBOUkFjQVpYZFluS0ZIWkVMM3lJVFQwNFVlWUo1QjZaMkRwME1TVnBsdlJi?=
 =?utf-8?B?dWc1RG9INEdMOG9nbVJGak53cHNPb0twOTI2KzBsMlJIWCtaSEl5N1Npc0x1?=
 =?utf-8?B?bUs3dWk5dUpJN0JpS1pSQkR1Q3gxZVlvSmN2T2RBV3daNktMSTdUZEJLdVEx?=
 =?utf-8?B?Nm5XTUFkQ2dIQkNUaXBsZS9RS2tCNm9sS1I5SEozQ3NoU0tKS2dyRmxmV3ll?=
 =?utf-8?B?NHhTVmxTRnFrZGVXK0w2SFZURENNc0NEL3FlMmhMaXp6ZVZKS3UwMVdKN0FN?=
 =?utf-8?Q?isqGvl52o9mpruUvdfMJWmfvI9NiscZc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXVQclNkUk5FS1hVZ2JJQUhQYWhrL1VKVEJma1hBbkZFdkxieWhpaWk4eEMw?=
 =?utf-8?B?dWRyNTkyYUhVc1ZuOTBTRGpSSWF0Ryt3SDVCdFNhNTZ5cTFiTmZ4WVBXNWd0?=
 =?utf-8?B?Rit4OVJmczFQQWFndzlKOFBsL21nUzEwc2gzc1c3ZEVOVVRxNEdpcTlnRkh3?=
 =?utf-8?B?aWxwbVNSNG1UR3hVWHp6RVRVc1RBNTV0b3c2UzFMbzBuUnM2OGZtdm4rbUhl?=
 =?utf-8?B?em1yUy9wOE1pL3lubHNXb0dmSTB0VzlGdDNhOVMwU1pUTHlEYmtCQWlsd3NU?=
 =?utf-8?B?N3BuLytaSHdZZ0hxZFovdTV5aDF0MjFWemhra0NVby9hcDIydThtMmQrRUpy?=
 =?utf-8?B?QTNGWWFOdE1rRjdNRVMvN1pSVUxHUFlod284b25kWVI5OXZVYmNZbGU4WkRi?=
 =?utf-8?B?dXNNTFVFNWhzc0VUVGV0SXBNdE51VDNCbDFmZWhvUUtJZUhiUk1UZnp6cktn?=
 =?utf-8?B?b3JQRm9nVWtkUGQ1YVpaUWk2eHZNU2x2RkZVVEVYRGQvZVNFczFVVDlBN0Zu?=
 =?utf-8?B?clRmYVlzZE1mdDRHNXhoUytFMmVSNWUrNHRnNFdSUUdQTm5Iei9uUlJjZFU5?=
 =?utf-8?B?MGRTcm90SlpJdzdPSWNWbGRtNU02b25qMkhzcTRQd01ZenFTSDk2dE9tUTdr?=
 =?utf-8?B?WTRDbmpHWVhuODRNdTB2WWlWS1Voem4wbFRCeDJWMEtWeStDR3ZDS1p1Wmw4?=
 =?utf-8?B?T2JJeFFLVnUyblVNYWZwUDNEcjJ5YUM0a1pmQUdFRFBkL2pMazhlOFgyUG1K?=
 =?utf-8?B?ek50allPMWJrZjBCazFiSVloRjJibFZrMWJhL2pBSFJoeEhxb09HYkFDZ0hS?=
 =?utf-8?B?UVN3OVE5MXpHSHMreU1pU3dkY3ZaRG1tTmtkSSsybVBiK3Y0QWt1UmpYejAr?=
 =?utf-8?B?RnBueHovSHF6eGZObnB6aWR4NlhEV1hOUWNPdzh0bFFPRUpkcmNyZEJXeWtH?=
 =?utf-8?B?U0tIR3h2TGpuaGNMZDZDQmo5c1IrdXVRUU9oUmpyVzNXVTRZV1UreWl6Nlc4?=
 =?utf-8?B?RWZkeTdQc3ZqR1pCemYxa1VWODlVM3lNbzIrZUhYVXZMUjRTbEFmdUpCVDJJ?=
 =?utf-8?B?a1JFempFeXR1YkZNNXVKazZXYzRXendEazVGYTdIcFV4cjhzYTFZUjMxckF5?=
 =?utf-8?B?anRleUV0Z3FybGxGU0s3OEJPbnYycCtQMnpRY3NWY2lwRkFpRmpNZk0ybWJz?=
 =?utf-8?B?NVd6dE5xcERCNURUbkowQ2h3VmVpcWZ0cjY5K3YxcnlQMTlHMndoTkNHbEZK?=
 =?utf-8?B?U0c2LzhTVGpyYjZHdnkzYnFJSmgzdFZsc096MmEwN3paRGIveXpXa21raXpQ?=
 =?utf-8?B?T25EbkdHcmdmRDRrM29ZUnl2ejNBOHBnV0tINDV1U0pRc2M5UllVSGl0RUxz?=
 =?utf-8?B?MFI2aWdQSVpXdUt1VDhZcnRwbng1aU5wazR5U1hmWmN5MGR1SjRhRTJwajho?=
 =?utf-8?B?aVhYYWI0L0ZMaWpHai9jbENOT1ZHWjMzbE16ZThvVEtJKzI0UnlIeFRBbk9J?=
 =?utf-8?B?dDcxWDVLempEelAvU2VYMFNRSmtSb2x3cE95clhLVzlpcWcrUURyQmdKWXFL?=
 =?utf-8?B?S1d3QWdJTlBIMk8zV2dXS0N3dithN1BUelBBcWlSSXdXNHgxZjcvRVVSZVRH?=
 =?utf-8?B?OFdPSTRzeU9tMlpMR25QSk94VTBGc0Y1dVpSU2hGRXBZUGZQM0tVYU1UVlkv?=
 =?utf-8?B?OGYvOXJVUU14bFZjK1NRRnVXS0p1c0twSUNVUnNVVU54QkRtclJsMFQ3VGJG?=
 =?utf-8?B?cENQdHZxZGM0KzVlMGJTMzJtT1BrNVlaYlV0MzRTc3llRTZkbmtYcG1DelNY?=
 =?utf-8?B?SjU0U1Y1Wmwrc09IUTZTNFhzcU5nWUZ4RmFhSDZGUXA5cG5GRVdhdnZjdVhq?=
 =?utf-8?B?Q083SzdkaS9CaTU0TUx6bUNYUUZSUE52cGVTMFVXejE1dllNdWJJeXErTWsz?=
 =?utf-8?B?am12ZFFZeE1OcjY3UEZIQ1VaOG9sT2ZHZURZTkVCajdhMlV3dHZtWVNvdUpu?=
 =?utf-8?B?QVJCWVQ0M3pwM0xnaXV3NjUybkFxWmtnRlUyTS9sRjhWbC9xU3l4SDdOQSto?=
 =?utf-8?B?SCt0dytFZmF3OHUvRW5MQWNUU3AxRHJ4a2RkdXJ2TmdQWWc3Z2R4TXhHeFZV?=
 =?utf-8?B?WjFEQ0cvamZ4NlRSTGlNZnFES00wYzkvM0FrajY2a3J3SFVOUDYzYUNUNTJj?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 939dc6dc-8258-499a-798c-08de1312a653
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:33:15.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93fzLg1KmboHrINr6Ns0LhtZ+o8JtLfKRhHPqAVlPMZw+MatP5udXtPYvXYG4S2e/ZfJzFAcCFwReSX8FQlqfaXTyL0RCwXn0riq3EmMqHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10853
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:33:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7831

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Part of bitbake.conf, this variable allowing to enable or disable
> translation was undocumented. Add a entry to the glossary.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

