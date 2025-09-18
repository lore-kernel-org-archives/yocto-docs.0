Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D2CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:03:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.14])
 by mx.groups.io with SMTP id smtpd.web11.10342.1758189823216792521
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JDgsh0Dl;
 spf=pass (domain: cherry.de, ip: 52.101.70.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euQQjW87rzvPtsWByX5ST/x+p/rgiBtz/VNLaombc8JpzjkSM5DB3tsZh62ABOM+5fFAJpTzEYWSDKVquqvzrOrJU6ehSzujy/578wlXEt4zFVk6XM23FPahhwVVsBM8gzhJflrMZIEJQ3FOiutvlLBaMgpf0jjWJY4zFe4uvjo+vmRcSuOcDBwX9/h/YpBnajFjfMIFpnUwxSNY8DulC0nwcX/vG209P7E8fjj8hlT0bAtjlVP1tU/xsA8F3h3D+upNJ73vYh849NHLEj1Y+BpOtUppPH10QKqH4dT7hEaFfDvyNFIoqQ8RGqUKIdPQY3v66ANDnDYqlv9GRZSZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWYChFovz1KdM/GeIv7cAwU3v8UHLV85ihf5A27TtTI=;
 b=WWSKXCjtog5zDomdmFda/cD3WfHZ20XJhxPY4v9peYgHJjQJx55MFVZYhFSeLIOKAcEKfEVpYTOGwPsBtCFqzZmrnABVqmnb5ylAR2vOj1ChG3Kho1gcHDcazLcJZEDD1LfU5Uz8NA5laCK9fYOLGci6EK5NHEmvCmhv7yh1tm94W9Z9wwsRaHob7zRPpxqTITIK46P1szqfrOiJSD66ty3uyMqSnoTie+HdmLql9/vOKvaJXLNMjA5RUR9bC4WZC4SWsP1Ezlm6TgmcMiAKgjHOpxa8uqtHN/hrI5k1nB7ZuHCuE/3ldtzO183Ln0tj70SkgGmXYH7+3IShHSPUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWYChFovz1KdM/GeIv7cAwU3v8UHLV85ihf5A27TtTI=;
 b=JDgsh0DlN/i8eo0AX8kolP3c3/nWObaews3VJQx0M+98qN88u8RxE7IveNVEc2103dfi5hzEjKdZQoMlzGTSHZFle+K5QNtXtdtTejRuZd1wgVKmabFsHj9zZFpGMxoQX+8r8FhB5S1Z/tLm06ZbpDH7P0BIecxwDUZozZLV93A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AMBPR04MB11743.eurprd04.prod.outlook.com (2603:10a6:20b:6f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 10:03:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 10:03:39 +0000
Message-ID: <9e6da26e-f697-4838-b204-7cae85c8d336@cherry.de>
Date: Thu, 18 Sep 2025 12:03:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drop Debian 11 from supported distros
To: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
References: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AMBPR04MB11743:EE_
X-MS-Office365-Filtering-Correlation-Id: 0148636d-b457-409c-4e91-08ddf69aa3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bTUzM2JqZ3RjT1JZT1lILzA0VnpWeGpoMTM0T1FLOTVSdSt2NkY5VFZwc0NS?=
 =?utf-8?B?eWVMSE8ybloxWnJMRkJHRWdPYldzd29OVW9wdHNHaHBpQUZNU2dlcFZFR0dL?=
 =?utf-8?B?SkJZaEMvYWVSTFR4ZFlINGZTRXV3SDhndzhVMG5ld3dCYUpwalVSd0VFb0kx?=
 =?utf-8?B?bnJ4am1tRUk5RVAxanREMVFteXhxOHJ5MGZiTWFZbGRwWXo5QVRsWTN0UEd5?=
 =?utf-8?B?d1FaNDZTWVd1bXZJaldWQitWa1R2QVJwTXppTEFvdkZLbTJValUybWRyelA0?=
 =?utf-8?B?ZGpmRnRyc250QmswUXhVbDhXVlJhY0dGRzZkaG15ZGU3eTkzd0ZXcjkrVGRZ?=
 =?utf-8?B?aUVTTG5RZHF5QVFpK1ErcUxXNjFuNzV1QXFjRmM2RmdLdThsWU94RmF6YnUv?=
 =?utf-8?B?TENZUzZ2anJiaGFmWmQwSE1FdEJmVTZ4bjg1Qm5FZDlwek1TKzErMWUrY2hQ?=
 =?utf-8?B?Y2FMcjdYWG84c0Y2enY2SEVSWGIwRUVoci9ERGhERzhuQTI3ZGpxT3VsUHRq?=
 =?utf-8?B?dUt6bVE2bDVPRkhEdGxaQUI3T3JXelIyNEo1WFlmWUJlUzBoVlRna1BrUmNB?=
 =?utf-8?B?dzkvUW40QTIxUGpkWlhMMFRweXFvMnJHMjdzU09PbGl0Mm5xV0g2eXdmMnQz?=
 =?utf-8?B?UnVWeHlzWEVnbG5nRjlJQ3J3eTNHckxjSjRwMFNwK2VKUytLalVwanZ4WG9o?=
 =?utf-8?B?UjdNREpmaVpXdUp3YXY4ZFBWSW1Uc2ZuVGd2OHdsSDZFYkJhY0RQcDVhZU50?=
 =?utf-8?B?ZkUzZ1JBYlp0RXZGK2w0NVdTUlljT2hQOGh0dFRCbU4zTER0VDB5bjBNaEJz?=
 =?utf-8?B?bnU4enBnY0VJK0plazZRdTZaSTVpSEpLYm55V1RBeFNxQ3ZEajU1c0FLaFJz?=
 =?utf-8?B?L1hyQi93RzUrM0RPL2dlZlc2S1ZaR25pdXdmK3JZTXJXaHc1OSszSFhlVTY4?=
 =?utf-8?B?RmJHc3hKSlBZQTUwWEdwRjk2STNoLzZqV0JxZXI5MTRUUlJKNUFMYWtrTlN1?=
 =?utf-8?B?V1Qxa2hEY284VnNyVndvL0VQMU56bVlBOWtCU0xQNi9VVHM3UXVTbk1RWFg1?=
 =?utf-8?B?UW1yTitVamViNTJzNUdpdWU3UUpUUS9KMEdDVi91M1QwTG9wb0I1Z2x3WW9a?=
 =?utf-8?B?TmFCYWNGcTFyM0tOM1dDYTZXcStEWHZENGo2NUJQTE9QeitBM3pnenlQQnhl?=
 =?utf-8?B?US9NUXFHWEY2QzZXYXFaQnd4ckdqWTNCbzRDSTJncU9jaCt1Wjg5RjdiZHVV?=
 =?utf-8?B?ajlUaEJkWGF1UG0wckxYMWY3NGdiV05Qa1V6dit5LzRnUG1jUEtZRU1tQytD?=
 =?utf-8?B?OHppemwwRnZ1dHNWcjJMWnF0ZnhmRFBsR2dsL1VmQkhvRVVPTUZiekZ5cE83?=
 =?utf-8?B?TzV4VzJGdWo1anlIcHV4Q0VYeXBDKzFnTU9Tb0QyWTBHcGhyNzUxdzZIaXNX?=
 =?utf-8?B?VExJVTZtYm5vNXFZUjBUMlFwZ1hVK05rUGRxK3BjVHlyUmdQYU9Ud1lPRUJS?=
 =?utf-8?B?R0kwOTR2RjBQdHN5NmxOU2o4b05rZWNMMXdCcXU5OGxFOWNrOU10L2xpUHp5?=
 =?utf-8?B?OVdiUmZ3T0dVb2M3OW9NV0kwL1RhaGlEM2U0aDB2bFllK2xJZEdtZ2VYZlN3?=
 =?utf-8?B?WStNWHpmYkdYUjZ5ZjgraytkWnE3c2YyTUZiemxaLzlPWGVRR2x6c3JlbWRr?=
 =?utf-8?B?OWJpajcya3IrdHdhZTA2WjhhU1ROVk5RZXZMNSt4aVFqUWFGaUtZdURORWF3?=
 =?utf-8?B?NC92RG5SWmJVNXFwMllqckh1NWlGYlhmZlg3d2YrUUF2aWlMSENlYXMxaUdu?=
 =?utf-8?Q?W75zRcCYTEhKm+2dxCnUhibQqqIg9qgk5mQPk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzhkZ21tb2V3ZjNoMjlBOEtUQ2JuUW13aVJ3S2JIN3V3NXB1em40STk4WlZ2?=
 =?utf-8?B?RURFVExwM2ZJTFBTYnJabmxjRWdNOFVSTWdKd0JUL1VCMUNJeldJWXVXZHdG?=
 =?utf-8?B?VEcyY3VKSHVxV2VzOVMvd0xEUVY1NmJxby9yOFVBZDE1Um5iemFDSWx0dHBa?=
 =?utf-8?B?SWhPZkZyQlNvZWM2b3pienU2WHEwSFlkSVgyQjZ2aEYrek84bVZta1lDaTJu?=
 =?utf-8?B?QVI5ZmszRHdSWmNEMHhNN0ZlSzc5TFRVZHRxcFBhNUVpaE5HOHpvcldRV2tk?=
 =?utf-8?B?aFRTSmUzZlh5UHA5TlFaRnZPb3hzSFdVN3dzR0FWbjYycmxQUWhDVGU3WmRx?=
 =?utf-8?B?ZEFsbkFmM2MraHREUkd5ZUFRMzgyV1FKbjQ4bmhuZTFhc3VBS2g0ZzdwcVBr?=
 =?utf-8?B?RjJsc2FNNCtGZTd0WDZBRk5KVUJTYk16SmlUVWlyTHcwTVRVWDVHREtmeTVV?=
 =?utf-8?B?cXlGMllZaGNUQ0Q3L0VmV1dJb2Q2bVlKelFEYm5JRG91YnR5RVNGdkpSeldQ?=
 =?utf-8?B?aDJnWUFwUDNYYnVGVXY2S1FReWI1cnliT0VJYU5Nbk0xNTlSdFNTV1E0RGx4?=
 =?utf-8?B?L0xmRFpXMiszZ25Ka2pjSnhORmZVUmE2cHdZQ0hGS0R5MGdGc1FqVkQ5NWM2?=
 =?utf-8?B?d1Y3T0JzTG1EL3dZK3loL21Hd0R3Q2ZrTC8vWDJKWk04OC9TbFhZbUxXc0JR?=
 =?utf-8?B?anVSR1QrUlJtMXZod3FCb3lvRjBqOEVubG5xaHRHYnFvYjBmUnExUjMrblcy?=
 =?utf-8?B?ay9FUXJ2NTRCMG84TkN4VUp3Q0Y0eHhFWldLSTZRbGpWclVzRWJlWFYxWUhr?=
 =?utf-8?B?dlo1aWxRNFBOL1RKL0N5ZEJvRUZodzNHcEhiRGNvd1hkdTh1eWtUbUh0ZXY2?=
 =?utf-8?B?eGFOOHdTYjlYaWREMUFHN2RnUTFYdDB5ZlA1aUtOck51L1VDYmJSTjhuWmtM?=
 =?utf-8?B?V1JRUGp4L0ZYUVB5a2hoaHZUWlpXYlBITmNGSlhkcjl6QWhRU1RETmp1VnZo?=
 =?utf-8?B?RGxsM2p3T1QzeXlMZUcwMmZFZjljRDFUTHM1OUljbU1udHdWcGFYallNNXFV?=
 =?utf-8?B?bGE3T1ZTN3Y3cEp0bVJlMm5OenpWZXB0Vm4vSDNQZ3AxbjNiZU1JVEs5ZWQx?=
 =?utf-8?B?b0JJbmhJSFJqZGhjL29sUG9kNU13Q3F6ckZiU21SLzZCTEp0aEQ0Q2ZYeGIy?=
 =?utf-8?B?WVhGMnVZeTdIaUVMS0JBeGtzMEhsa0Z5Ym5tT002MWFla0JieS9aQWlLWXVN?=
 =?utf-8?B?NzVleS9DVG1pRjNJUHNLN0xpYWRUVlZDWkpzTzZpeE1QTGZOQnphaHRFVVZu?=
 =?utf-8?B?MXZPZ1plTDNISUlvZE5vTXYwKysveVNFeHZnMEp5eWtYallhYnBod2ZGeWN6?=
 =?utf-8?B?N20rUjhTeVVIZHlVUGRDcHRnMXpiZk5OVjU3VmNVS3htN2t3T3pNRHNFS1FK?=
 =?utf-8?B?Nk1KeHNzbkJwajhTYllXN1U4MDRZZnJTYWI1Zk9rdkYwUlBEZGN1Snl1eXU2?=
 =?utf-8?B?SkR4MjBudXozbi9RTFBybVBrTnNKWDcvSmgvbmxVYWV3bkhIN1lzcXJPblBq?=
 =?utf-8?B?cFZyemhNWjZKSTBlQjNzRDgvL0xFYmZHNG1RdGp0M2xyL2p6RWxtWUpmYnpo?=
 =?utf-8?B?RUNKSysxUEFWMWY0UHZnYlB3bFg3aU9wc0FaOTc1YnpaSkJMajJFZC9xUXd5?=
 =?utf-8?B?L3FNMFlkY0d5N3RneDZVMFlyN1IzQUgvQ3Bvbm5pbG5XRTRlcTVraEpEOVVt?=
 =?utf-8?B?dlV1cXovKzdqYnlMT1dxNFI0VnVPcEQ3VndCdG5vK3ZlRDhYQzdIRmRFdE9z?=
 =?utf-8?B?MSsrMzNKN3pSQUV3TlZRSzZnTU9acWlzb3VMektOMGlaWFpFRnVKeG96TkZM?=
 =?utf-8?B?b3F2MWxZNXdJeHNLK3cyTlAzWW4yL3BUL3pGbEdWOEd0cC84a0p1eVlGRWt2?=
 =?utf-8?B?RmlRTUdPMEp0RUdIUTVWVUhMblBkNUtVOGNxeUltTXVpMW91V3kwRVBaNjBj?=
 =?utf-8?B?U3FBNWw1b2pQc2w0Q1NtMkROUTFMZWtjUjhyaGdTR0NaTEdTc1g0bzEvamVZ?=
 =?utf-8?B?M3JHSWVYSEFsZnMrc2l3bUo0MGVuRmhqRGJJVkx1YWNTVkNZZHo3UVpHSUl1?=
 =?utf-8?B?ZzdtWEVIVGZnNS8weHdLRWliVDc3RG9UWlkxcUFHUTlRdzdQQ1k3ejB2aHBi?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0148636d-b457-409c-4e91-08ddf69aa3ff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:03:39.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTwXTgr4/mN0D3pgmOwmRh6BekR9xL2XAc0KqrPQXEZgdHcqwqMLoLRBzxXdUIRZ7++g2XWRiDnJoVkBuWN9KJrcJN7Oc3rr63Pb1i85mC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11743
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 10:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7542

Reading a bit more the docs, I'm wondering if we shouldn't add Debian 11 
to the list of "distros we supported but we don't anymore" for older 
releases in the docs, e.g. kirkstone, scarthgap and walnascar if we 
really are dropping Debian 11 from the builders?

On 9/18/25 10:56 AM, Quentin Schulz wrote:
> Ross recently sent a patch to remove Debian 11 from supported distros in
> poky[1].
> 
> Let's do the same for the docs.
> 
> While at it, I also removed some comments in the build-docs-container
> for distros we currently couldn't support because of missing packages
> (or other issues) that we anyway don't support anymore.
> 
> [1] https://lore.kernel.org/poky/20250911195545.3525333-1-ross.burton@arm.com/
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (2):
>        tools: build-docs-container: remove comment for unsupported distros
>        remove Debian 11 Bullseye from supported distros
> 
>   documentation/ref-manual/system-requirements.rst | 1 -
>   documentation/tools/build-docs-container         | 5 -----
>   2 files changed, 6 deletions(-)
> ---
> base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
> change-id: 20250917-dev-supported-distros-8b891a0d1fa9
> 
> Best regards,


