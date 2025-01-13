Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B011CC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:58:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web11.22527.1736787489316093647
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dDdnbJTb;
 spf=pass (domain: cherry.de, ip: 40.107.105.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbbZs3JbKU+N8sUahksmlNJrhpPI0KoVbJlj1pbHbTI9wQ6xfbx97WqhEJItRVdxQNJTzSv3yevwbc+bhN8JXkZk+TDLwYCwtGsoEbGB46fd+vbI2dQbm2f2sQvjfIEV52VcWGJQVahfUnqyiHe/C1VgMkOGTHPbHsD6NdlnPwWHckNToDvchFBeVKBH4Jd5GjYbQvIFE9XiX4WC10DGNqkQb1A7BhSZrjOjlPz3C56UpLaxxt86qvLLAAgyS3l7GzoSLKFMS3NgQuzow6vaWxxmPDpRkkEEOR0WlocNKp20k1gubDcnWbywDhunuOGFuX9xLjqeXzzqkXpK4YxpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3YoVQx3ZtD74mA99/DCa2Xj30XDXbziKey9SRx0+FY=;
 b=iVwCFrOUK6rqPfkQaTWYCtPpNx9202rpxU9eb67ufcc9n6rwVhFNHN6JEQ6qci4xTZTEVwO9FLz0qAxCTbAEZhyobtcC9YNZOKXEInSJuIYbUJEqqZyKj2aZ2+RGST59Ecr+lIv/LI4fsIeGw/cW+a2S9oePebYnogEp6BkDXNJjSHfOlLhVZbiGkciLGrQTCIaMBbV9NRsmax54BumhWtUliGHyj0yOKi9Qn2+cw5WYWp5tftB3ZGCqWuKcrI++zJ22ugXgqoVvvclax5xmdH1sBYztqzfCOYfD9QRNq2rIOdn8bWIU4IJIQK/cGit8/kZ3/Xq/JZ5qfjJ+FB4UXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3YoVQx3ZtD74mA99/DCa2Xj30XDXbziKey9SRx0+FY=;
 b=dDdnbJTb0UZD2+bi3Dt+jUjLnq4AOedYaJGsEYime9asqlcLoOIPw2iVll2RUDw3FZziEKsP86v5eE6egnwkV8t46fZKQY9fapOLL7mOZGB4i2OpqYawIny5VXv/QlcHCAgSy9l0Zqd4UtP7ql9FlmAeJus3wyQmoXU742fVxaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9442.eurprd04.prod.outlook.com (2603:10a6:10:35a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.15; Mon, 13 Jan
 2025 16:58:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 16:58:06 +0000
Message-ID: <515eaf26-fbfc-441f-a70e-205f23e22025@cherry.de>
Date: Mon, 13 Jan 2025 17:58:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/2] ref-manual: move runtime-testing section to
 the test-manual
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
 <20241226-move-ptest-to-test-manual-v2-2-227db1b045a2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241226-move-ptest-to-test-manual-v2-2-227db1b045a2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:803:118::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 253e705a-c64d-493c-d188-08dd33f37320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlU1bG5aTkNKNGwwUnR4M0JQZU5QVytPVVpxZzlIUHA3R2pzeTFoYTFSZm9H?=
 =?utf-8?B?ajhmWDIyNHgyak8yYmNPdlRKSnZ2b2JNVkZQYmRydDV0YzlITG5YRk1FYVRB?=
 =?utf-8?B?Q3lrL3ZkM05JYTN1bWhibTRHS0V6Q3d6ZkZxcFZuNlF2QWxQeVhHb1JZSGl1?=
 =?utf-8?B?WWpYL3MyWG5TUCtXVTFISnlqR2FXWWszcWpJME02aE1OMGF0K1V2bEJ1ckUv?=
 =?utf-8?B?TElGZWZJTlYrN2F0VUJMQ3NkZ3BXcHJXUk1JbjhRdXl4Mm1haGYxTHprbXc4?=
 =?utf-8?B?U0o5WTNYbUcweExzaWhxZFNpMkVISnQwendndW1ObVRrNzJTbCtYTnQ3aWY4?=
 =?utf-8?B?dXNsZmhEZGVaL1hDUG94REdWd1Yzb1VnM2tUVVY3MUlac0lyMmtmamxmaDVJ?=
 =?utf-8?B?OTUva2xlbFN6WUpTVUJjQ3B3ZFdIaG1JQ2Z4TEl4eHA1MUtmMDdYZUxKN3Qx?=
 =?utf-8?B?QldqS0Z5M2p6WE9FNUNGdzEzNFNFVENjK1lySE1MSjVmdXBFdUR1OEJNaUVh?=
 =?utf-8?B?bDFuT1RtRFRJdysrK3RVM2V2Y2VCQytnWkZoSTZvR0lnOEZEakZJUEZGMmQ0?=
 =?utf-8?B?UG1KYXpoU3hQbkpaTTQwOENFNWdKVlFlWnRpUDhZTVZUZDQrY2hlUHdGUHI2?=
 =?utf-8?B?SDZTb095TkxvZWlNcTgvOThJYVVSWDRJREpvY1k1VzFSQmtvVDMra2V5V2lm?=
 =?utf-8?B?S1ZwSStobHdzTDhsZDVwbU1kVXRZWmV1bklQaS95d0FTdEhhdDB6TldjczN1?=
 =?utf-8?B?STAzM0RkL0VZNVVCeUVIa3JkdkFjVDZLQm02ZjNBVnlJZm9yMHBDamV1TVNw?=
 =?utf-8?B?R1NrZ0wxWWRFS3pDM0dWYXZrU0hkeHNGNUpqVDlEQ0dHQ0FqVTNyejhXcjZB?=
 =?utf-8?B?b3plNmpRZFhIeWVjcUhaQjhPMlFOT08vaE5samY1bzk4UjVFa0hHUDBFUm1X?=
 =?utf-8?B?RTJzSUlYdUpWV1Z2NTBWcXRZdGI1S2swSkQvS0Q3YlpLYkNvcjZYQitnZXlz?=
 =?utf-8?B?b2daYjlTNXZPZ3dUdXVMYnNkaEZnRGtVQ055eUh5b25pTlAyVnQ0dC9yc1Rs?=
 =?utf-8?B?NUxYY2ppSURIajluR0Z1NHNSb21VWmNNZlVOVWJxZ2FhM2tPUmJjUzZYakRF?=
 =?utf-8?B?Z3M3WWliWlFrb3QwS2xBZUhZVVJIYTh5d1U3S0t0RW54MEJ3SUk5b2IyaEhK?=
 =?utf-8?B?VHNNMHo3WGV6Vnozc3l1MCtyRk9xQk0zQkpGUkJGUTNGYXZReG8vUUh2WjZU?=
 =?utf-8?B?cnRsMHJGTW5FSE9QMTNmYnRXSnd4Q1pSU2g4MGl0c0MvYnUvLytEV2lVK1p3?=
 =?utf-8?B?eTQ5clVrZXk3Tm9SUkJQZEFiMGR4UndyMTZtWE9RcHFhWStVM2xPZGhsd2JQ?=
 =?utf-8?B?a3h0NXBsV2RmSzMrZFpHYmZhS0Z1ZWxxMExLSG1ZejB1bWlIRVluTXZTMnEy?=
 =?utf-8?B?ekpGa00zVWwwTFhBNGVPMTMwUUtyWEtWRkN1YWNrU04vdlBTcm5ZbG5YL3V4?=
 =?utf-8?B?OVBlNzBKcExNRFBoQmJadnIydTZwbFRTMWtaK0ltdm5JWDlxWklrY0tSV215?=
 =?utf-8?B?SkJnOUFETVhGVUdEdytxS1gwSnpWVi9vcXNOdG1rVCthM0h0aWpHRXpXWUx5?=
 =?utf-8?B?ZVVMbmRjOEt4aDZ6MC9NU1BLVWRMbHpUOW13cW16YmRhWFUxMXArT3M1Uis1?=
 =?utf-8?B?WFpnUUZNVnBsK0dPd1pjaHhpWHJ6SUJWdWkyYXFtVUhqSVhVWFpCVkJ2TEdJ?=
 =?utf-8?B?czNqVVJ3Y1UzbVdJOUZQdlFCbkRPN05VamFpTmo0YkFkaFRqSXA5MkxGVUNn?=
 =?utf-8?B?QkpDZFpGQ3IxRVdMMHNhazBSYk1NRXpwYmVQelhaR0JUbWkxTTNFYjRXbEdE?=
 =?utf-8?Q?ivFrE8LGkBVyz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUtIQWFuczBHRld3R29SK0d5cWd6Y25GMFdKOUxEa05YZUE1NmZmR2RSZkRl?=
 =?utf-8?B?VnFPazNwc1Z5UmJ2aUdNS0dKTUwra056ejZkTGpXV0w5OEQvMHRuMUt2S2Jo?=
 =?utf-8?B?aG04S0FRdUhER1ByeXhlMFVrVW1FZTg0aXk5MWFaS0k0WlhNRUl1RHJ1dDFQ?=
 =?utf-8?B?bnRiN0RETzZRdG04ay9STnpER1NzUG1GL0d4RmdRdm5WSzBvckxLcVBoMnZV?=
 =?utf-8?B?TE9Kdjh3S1NFQURyN3JtTlBoTno5azdDWFd4NkVkdUtwRUZ0NnFlS2FRMFJD?=
 =?utf-8?B?OGY2aFRBcUU2cm9VaW9KMHN6cVM1LzBPeUlBNUJsWlpXM21RL2VBc2JzRGxT?=
 =?utf-8?B?Y1BSZllxZ2xVc2F4TEVERUluL1dReGxjRHpnTktpUWpTL2xoUGY0R01mVjVl?=
 =?utf-8?B?V1d5UU5IS0lnemhUY3czVHBsZE92T3BialRzeDZ5S1lJQks2NXpzSCtlWFBB?=
 =?utf-8?B?TEVpUmF3cktsSVBwcDAvVUQvOWE3eEx1MWZoWWcvVEw4RzE3bWtrTk81QlRO?=
 =?utf-8?B?WlRFb1Q5b0VVOXowQ3QwUmVEa0tXYUtWODdQb3dBNTVNc3hRM2Z1K0taUzhC?=
 =?utf-8?B?cEZsMkVIcXR4aVIwUE1GWHRWN3ZjNVpqZFdJeXM5N2NUa0gvMUR6Y1VGbnky?=
 =?utf-8?B?eE9VemdjUnd0Tk9lYmRYQ0dMd0N5Nm95Qy9IMlFWVkJMOTZ2bjJNa3FqcVpT?=
 =?utf-8?B?TEh5d2dsVmkzaXJaWWpjMTRlUm5LWlV1dHFHaC9RVWhMdWMvTm9qTlo2SWZX?=
 =?utf-8?B?UHhzUDhEdzlxa1NxOFlvM1pteGZuMm93WVNYa1ZkdGdlUTB5ME9nSGVtOFpX?=
 =?utf-8?B?M1hUYzVWN2QzOW43bWVGODdhSitpUjd4cmZSNjhZVDZKNld3cjhyb2EzZkVK?=
 =?utf-8?B?QnJGMEFzeDFnbDRybUlFZTBSM2lSMUJLMEdybWp4VUk5bnJYT3Q0SjB6ZkdE?=
 =?utf-8?B?OCt6a21aN09vb3Y0VmZUSS9EL3dSaGQvMDZvYk82VGVBTHBnUGpod2sySjAr?=
 =?utf-8?B?b2grWm03NHd2cUFuZXNRS3VNOEd2eTVtbmJ1UGx0SnF4dzdUL2RYbzl1MmFk?=
 =?utf-8?B?VGVSWTJmZ1VONGU0WmYrWGhCK2tVL05FN25PMzFSeG9aYnJxdVp6eUxJZFpS?=
 =?utf-8?B?WmErR2hrQkQ0ZVJid2FENk5zSFljSk41ci9tY0s2YWRlTlN0bDg4M2Foc09n?=
 =?utf-8?B?VEVLeGllRWxXSVNTYzVJZWFiVk81TFpSd3lNR1JqUWJGaHNuQ2FTL3EzaFNt?=
 =?utf-8?B?enc1RVh4UFQ3Q3RWdHE4bnhZRjNRZlA3N0xWUDlDNTlWb1czSTk1dklUOERU?=
 =?utf-8?B?L0VvRmU5UG5WZ0lTYVdxNUlhcEp0U0kvL1JVcGdmbjQxNUZFWENKRlpVUUJE?=
 =?utf-8?B?dmlpSVJBZ045djNCMGNpK3VWejE2RFE1czJwZmhCOFliNW1BcVFJT3NWclkx?=
 =?utf-8?B?MFVLUWdDYnMvbjYvQnFZSkVFVmxjb0taTU94emd5bTNWTXdnUmhuVmtkcm9J?=
 =?utf-8?B?bjlrV01aTk1FS1ZOSWJuWndJdFhHZ1I4YWc3RFVTUUhONVhUTzB4Q1NobzNi?=
 =?utf-8?B?Vkw0QjBsTUZQdXBDT09XUFIxNWk1WXJzeGRDU0dDd2VvWmltUFRyaEIxUWFm?=
 =?utf-8?B?eit3R0thR2paREdnS05uWW5pM2VvWHcwcm1TVU5jMnhmc1NWTGt5YlE5Qmtt?=
 =?utf-8?B?QzF2MVN6bDU1UklTdUFSTDRVcks2ejRybEFBZWVwdzd3WmticzhzcHB5Rkw5?=
 =?utf-8?B?Q3htNmFoM0xQK3dNZ1RUcGp1OXJjb0lMSmtoMGo5b2E0VG9qTXFsRlNWRWZO?=
 =?utf-8?B?TnVPbGl3MGR5YnBLVWtFcVZlVlBNT3d2MERsRFJmM2RQU1RYTnI3VlJQZXl0?=
 =?utf-8?B?bXJidEhpY1hmRzFqR0xXblp4L0RTdlprL1FEdGdDM2ZtR3IrTWxYRERuY0d4?=
 =?utf-8?B?OU1GY1ZMTjN3bUNFZ1EvdTBiMU5OR3ZSNWpoM1pqZ3FDdjJhNFlQbjhVTnFN?=
 =?utf-8?B?QXExVXJVZ1dPYXVZWHgrY3lVVEpoVGUxUG5VeUVKTXB3ODBJV0RmdGVNTEk3?=
 =?utf-8?B?RklGWitRYzV6ZmxYRUtFZ1R5UWx4QXdlbVNUWGJndUpwOTZQeVhicGphYVZ2?=
 =?utf-8?B?akE3RG1FZy9sRzJMSFBENXo2UlM3L01KUFJZZWNka01iK1dJQ3M5cExkcXNK?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 253e705a-c64d-493c-d188-08dd33f37320
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:58:06.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9r5SuEbNikfAE9OO++jNM3aEIarTReS3Td6YM19vNgQM41+bwEHmHkiGbv76CSnuIO2YsGqV6RlMD3wXBKUsTEk69HbGGsouoFqbmF5FBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9442
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6089

Hi Antonin,

On 12/26/24 4:20 PM, Antonin Godard via lists.yoctoproject.org wrote:
> In the same fashion as 32bcaa6b5765fff561afd531b03b9735da6eb6e1
> ("ref-manual/packages: move ptest section to the test-manual"), move the
> runtime testing section of the development tasks manual to the test
> environment manual.
> 
> Add a link to it from the test-manual/intro document.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

