Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD25BCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:53:45 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44304.1781880823610076972
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DUWfafxp;
 spf=pass (domain: cherry.de, ip: 52.101.66.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFmJMMrQOgM/usGSGLji0dZWHmPrdkFrCEdUWtodifqKxQkdidDlNHIGhseiX4OIKAR7LTqcBqBUGdFt9ynVzVPY+NY/xrSCT1S4X5pvTdQ7y1iE9MZSWUx+OHm5qFeCO5b7WSAAFecc9Ccgz00+0VdLMLQ5r28PJ9EW84N4MlqvLt52Bd7+st5ydmTp65qvvcUB2riZsPYicFSoYSJftbluYsXTHWwTpbRt/h1Ti3CSmeza4Xy+1HUyoCoPyB/tzveZQbnF+6wOzyIPBKBc/oJ5m2ZNL+nq8HD8g3x9K1LOflIaeGtVYBWT7ORNhTw7rIa8ThVQclhAc8IxDBQblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04kzq2N0CFklc+WsNGQhFG38GHRr0ND/pje5ZkEe+g4=;
 b=Znjz+jz6xMvE6smjdqemNZMPLIyEvrCy52FlQn7ALdJ2SEcuqDt/vzhUgyJWv+w3nqdkWSjRXJOBzbqG+lk6FtgPWxGm2ZKp7anyTScsgrXC3hrBCJfnOz50nNId+q2WGl/WMDDkVYqmFXOEhMcQhLLNMnU487RcTkSdQoO06+gHGIMFyHqaVHcAAMJp85oSyj8Cd7hcYPgow+ANKO6MAR1/4r1jBnVvDWXOZhKdkEV/AwDvgeH7bwGv/jYfk8vvpoFWS+Xn6hqaKQmtE5ijbI/RsetoQEjm/xEcLOyMU69sxb5C45L13jRsgvoop94Vie44zZ3SSKcIJeh2FRwldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04kzq2N0CFklc+WsNGQhFG38GHRr0ND/pje5ZkEe+g4=;
 b=DUWfafxpNZ+DYpqP8K3VyK2arHfuBPgexDDMwJy66flJDWQMPX/GzIIpQ5P93GFECWicWjtT3fFvW0tneVEqZ1mdTuDeiRlqV1rixLupntUZ5VPgHdb62nKoJkObWbLAav+rFwOUvqdm2n+8Qhv9xRQUKliXTjG1QBjoqk9n+/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI2PR04MB10219.eurprd04.prod.outlook.com (2603:10a6:800:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:53:39 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:53:39 +0000
Message-ID: <673e1efb-03bd-49bf-becc-922638e93a14@cherry.de>
Date: Fri, 19 Jun 2026 16:53:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: fix grammatical error, missing word
 "with"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <a1d31ebe-dd6b-ce3f-f1da-4dea86f02010@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <a1d31ebe-dd6b-ce3f-f1da-4dea86f02010@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0101.eurprd04.prod.outlook.com
 (2603:10a6:803:64::36) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI2PR04MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: 20083548-2c2c-421e-aee1-08dece128c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vQjoKUn39lQaI/CzWdYORSEH2G1LRVYtwz3uPvC2RA+EhCxPUS/7qPM1jIGV5Adr1wawPiwdkjQMk5MYQ7aWLOjfG1A00OOLAnpikEYNtOxJEKJEwAKHM5d/+y9tr7ECsXF75BlLcAeSuS+C1eIgnqnEPoWRpCwqQ7DX0963Nitw/aEYFgakv4xBH7Er3T9XB5ztnDv6Kkx58x3qtUMnACsGboK4u+F3solfrsjmdm4fgkZDmFLyoa6vhLPsxnZ8rvXVTTTCpKl+oLdUhVqTi4vvNLaKTfANq+KUK5CSEnS/4PSW4nltUYFW16nxa6H0aVcowhOTWI9TTaaBx2GCwHZUWEKpwpGLLYFYRxDuJxYsUxuCem4kAOYvy4EV356Smz5ASERhwVrDLb6u4Pqz/C9BEx7u5V/hPwRVQHmMwPrtOtgs/taHMjO/zeGhJGZ0DvSM0poz8Wh3Lpdr5AYwdfl65/yVyzgEXe9m8EuRou9rM9dsw84Z1GZvDJfR6XoJBHQop33Rh79KazXR8Ztue+t8UjVj1L788gjTq8V1RPhx7pqFnY+d3+vfnGCPxYJGKhpHsKD3Xqm1uMwvNZ1LF4WzEdnAAdg1/tT9Vq+KjBgTVrFjDOzdIwmwmrx4R+Sa20Hae/XI+d0LQdM9uQw1kqHT4t9RDBR5rSn2YI2KACc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0RZR21BeDBVSkxLQXZWWHdoOGthOGZKejUvSVExbHRodzVNc0tIVitRNVJH?=
 =?utf-8?B?a0U2aWNVbUNXWUYxVUxuTmpYYXVZUUlOZTY2UlFYRG1ZT1JuaGMyYlJzOWd0?=
 =?utf-8?B?Z0hxWUQ5d21wWTBkZHdoWnlRVDl0Q3htRjFZSzhDRThLbHJocGI4RHFXejcv?=
 =?utf-8?B?QU5ZMHdlUWdMMjI5aHd2b0pTY3BBU2NxNW5PL20vQ0RWNTNxdkh0WHNzcTFG?=
 =?utf-8?B?MCtkOTg2enh4Sk9YQmZGQmZ0MS9WdVlzNG4vV0VkY29sZU9GVi9Na096K2Ny?=
 =?utf-8?B?SXFTczJ4b0R0TFFjZ3ZEQTM4NjNiNW4zOW9zaWhkWjhELzFOWWZxUGpxYXg4?=
 =?utf-8?B?Nk1xY2hZZUlRVWZDaUd1VHRFYktkWTJxVUZPaEo3eW5rSHRjM29wdW9NY3pV?=
 =?utf-8?B?TEU1bGNXL1ovZXZwcWpvZ1Q2UUZhWSs5TXEzU0VwazZEMjRFcGRXajd0eUFH?=
 =?utf-8?B?V0lVak93aHJmNzNUV3lINnlNeEQ4M0l5MlpuYmYwdEFENkZNNlR3SXFVWjFm?=
 =?utf-8?B?UWU5bW8yblFwTU15ZTBsSlpia0JBaGtxMVhadDJudlpNeWJISk54SHhtUFZt?=
 =?utf-8?B?SEZiaDJVOVJKVVpranN2SjFXZXB6eWxzTnBlK3pqVTNGUjdhSDlwWjBSZjlY?=
 =?utf-8?B?NmhLRTNzSHUvQmdVdDdhNFQ3YitEMmFCZUYrYmY3RnVWN2hPd3l4K2owT2J3?=
 =?utf-8?B?aDlaT1RqbkxBUmlka091d1NaQjFmS3JjZVZxc0w1Y1VZZFRJL2ZoL3hCUzBG?=
 =?utf-8?B?dUVMTWxvaEJkaXpuaGZVNy9wR202ekFQVEpPd0hMNVhSMTNsbU9BTFFEV3Rz?=
 =?utf-8?B?bUdRMXNkOVdGZ2daQWNacVdlN3NxRmxZV2RiQ0JsQzNZZVRQbkdpQll3dWl3?=
 =?utf-8?B?N3h4VmEvdzJZcDJaNVlNSTk4K3VkVm9ML0JPUzVtbGNDZkxMN1dqM3dBalJB?=
 =?utf-8?B?KzVXT0g2Tkw1NGxUWjJVRFZFVGl3T0dVais2Z09qQzloVmhIYUc0VEkrR3I0?=
 =?utf-8?B?KzNNNmNCaDg2ZU5JSzF0c1pVZ285M0lkNkF4SnovK2hIWmpsZkdQdFJ2NmRp?=
 =?utf-8?B?M245OEZScGwreno4QklaVjVHVzh3ak9QcFNmSEJYeC8zWlR0YW9DdGNrK2s3?=
 =?utf-8?B?OHNWdnp1NHRlL3huZ1IybDN2WGdob3dKT2NaSkNVRzhXTGRuTXV5RnZYaTdJ?=
 =?utf-8?B?VGk3L2s1bmlQVW1EZjEyMlVsd00ycVVsRzNzZGtmVFNvTHMreTFQRHVvZHhY?=
 =?utf-8?B?UlhlM0F0bnM1Z3NFZnV6SGU2Rk4wZkJQZElwY0h1Ky9VYjRpNXQ2YXgvbDVy?=
 =?utf-8?B?L3A2ZmpwUjRFOFNCQU9NbjNETzdBUUZkbGNYNk5jMUZoMUxmL2s5T01OZWJx?=
 =?utf-8?B?Mm5MdXhLVEFwb250NHU5cEtVb1NJK2QvMVprbUtsalZBUyttNVRSRXlISURm?=
 =?utf-8?B?T3pBRXUwRW1CbWp5b1NOUlo4c3d5eE9udGpEdEVvQzcxeGFkaTFZWFEzRFJs?=
 =?utf-8?B?VGlJS3JXUVQyMlJkVmJjZjltWGZHQnppSTlhOXZ0T29nVHpMWmpselY1Y1NF?=
 =?utf-8?B?dEpTMlZZT20yN2dnRjNFMnlvdEpsaHcycmVxcWFlSkM1VWZVVEs5c0RESG1S?=
 =?utf-8?B?TFpQUXdZZEcrT250MFgvTWNHQ3l1MUM0Vy9zOTZtWXpvQTBDUy9NZXR3UmxT?=
 =?utf-8?B?MFFJWTBpUU9COHMwb0lGQkdQQUduUzkyZUlUaHdFNXpXckthaU45QlJxOE1I?=
 =?utf-8?B?ajVIU3p6R3d0UEh3N2R2ZjQyTTBRZmRqdytUNWpSbS92dFpjclNtYTNCV3B4?=
 =?utf-8?B?RzMyeWVFWlA2ZTN0QUFMUWRVemNWL1RHSUZuWHFrUmd1RkE2d0VjaFlNT2hR?=
 =?utf-8?B?aWIxbHU2dFQ5Tlg5QmZTdDgzakpBVUFmclNWa0FJL0dlWElYWHdzODhzM3Na?=
 =?utf-8?B?ZGd5UmIwaUFwb1pobWZ0M3plcnE5RUtMMHZSV2xlTTVMVnFwQ2orM2lnWXpm?=
 =?utf-8?B?enVkZkRoczBhQkNxcXlsMENIMzJHVi91RXcvZC84eHVsZXhDOHdVQktQakY2?=
 =?utf-8?B?bUdCc0dtVzBKMjUrTXB5Q0NrWTV5cmdzb2FVMGVoTXoyYXV6NmNKS082eG56?=
 =?utf-8?B?MlhDcTZxajJNYzg0b2F1WmRmeC9QTG9YTkw4TnllNkNkcXlvakQ5aWpEa0x4?=
 =?utf-8?B?cDBpRk1JdXI4SGtFNitjMDZaYVZZVWV1SUlIUjBNWEo2UHRqdWo0b1JTWUEw?=
 =?utf-8?B?bFZBUTVHRFlnUzNIcjBVclhDbzBGSlpHNTBlc1hVd1Zic3VWOEROT1VPRk5B?=
 =?utf-8?B?eHo2R2toNTVuTzhhNFprM0QwVnVpMnE4dGIyRGZQRkNnbHcxdWZSdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20083548-2c2c-421e-aee1-08dece128c7f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:53:39.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB8EbLCzCeEsG+PFqkSS9PNObGkqYzc0xioYKDZsZtcqVBflaaZHkGOz+H4+51Qu1Iw+UwgpqAxy1mkHfEu8kF6Dsg03xLZb/7hgY4NtRSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9793

Hi Robert,

On 6/11/26 10:31 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Add the missing word "with."
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

