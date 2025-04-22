Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FE3C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 16:51:47 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.51])
 by mx.groups.io with SMTP id smtpd.web11.45283.1745340698808682809
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 09:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=m0Q9/hbN;
 spf=pass (domain: cherry.de, ip: 40.107.103.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLXorzUlKRZnKG6JqUaTvnlBUs9kx8LmtLYEImUULn73H4a2Iu1P1SVmgAoFBvYRqxnUFKzdxrI3jVFKLM0KbqAxJE+rwirGVUVAKYmZ5DA1WiuYAwuNl/aXGwLZdofmufwOEtyB7IBDAb+YXO9GlZkvVqK+fbLsgdU4sWacWB4rYJpGl6i27u+U5O+V1B4hjOgULd7JoxwByF8ys9jf4NwwV6QGeqiACp/Hs9lN6h888JgOH8iOcAn7SHMdv0badNsXcQ76ZQeKl9ezmtjfZ1g1V8/hKIGzg/yqbpK6ejEu9Ofh/qWxvg4keHHIvy0iE+PvBTgoMR/yJWF7X2mQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4xn6kmdHryPUbbSAnpln47gdENB35urvB2LiG4Jduk=;
 b=NliFCZHYl3nNSHLo7eb6mN+le9F6pkbnOl6gzc7+771LaZQhTACDcUqNQ/gFJ2nubcsb6y/sP4sn9yQWfzcfDEID+Plm5RMtq+D714TUs7tfgaN5wDfbpzgQCv7/O5vN36rWfncmW3bIPuk7gMmIBwL+FU3TYIi+RdVWlvRCzS2YN7vazxqDjcXbJS5EbrUiMRxt0OWRZ5+9SeCC+Qa4lGfkJhw+ufz8YAZiRnlco+3RyxoHT4HvJ64Xk3rFfgm67mL5lk5WOCRNahel3GOP8LcNMMNO51hhznhxLH2k3kmMJUf7/gCRartf9AZQzfq04XUmWMRSpdmPsF6GG8805w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4xn6kmdHryPUbbSAnpln47gdENB35urvB2LiG4Jduk=;
 b=m0Q9/hbNkSuCLAhAGxpgl8G4el5/x7K3EGCdK7m5//uRNS6eSVZd+OvycoeHQ/RCwUTXd8Zdx50CHIRTiLRK6TdRC/q0DyVfm50MCnsKVWAU2cb43z37xtkvaj31e5hsY29Hmcb76nYV3N6wgZIvAM0+x4z4c/r5fuViRjS4Ud8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:51:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:51:34 +0000
Message-ID: <780e5074-3c66-4ed2-9c80-3694f76a9604@cherry.de>
Date: Tue, 22 Apr 2025 18:51:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] migration-guides/release-notes-5.2.rst: fix
 badly formatted gstreamer entries
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250422-release-note-5-2-cve-fixes-v1-0-1d3756fe2417@bootlin.com>
 <20250422-release-note-5-2-cve-fixes-v1-1-1d3756fe2417@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250422-release-note-5-2-cve-fixes-v1-1-1d3756fe2417@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c0382d-c2e2-4285-6f38-08dd81bdf068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VEFIRWNuZzZCZmVid1F1UlBWcEJzajNjbDVnWk9lZXUxL2JHQ3dzZjVOZW04?=
 =?utf-8?B?Ui8zUVV1MU5tdS9sSVVNMW4ybzAyYzI3L041bjdpNlNSUGU4U0RWR3I3aS92?=
 =?utf-8?B?UzdaZjFpMURxenIraVNxZU5MMFlUb0U0SnArdHZNZWlOTzcrWU5KenFpRk9k?=
 =?utf-8?B?QmJwYzRQbnp6UElYVnpNa1NjWUdLY0Jpd2w1WWJjS1EvemdwZS95QzlPejNV?=
 =?utf-8?B?SDVNOTVQTm9qT2daamR4SU00QWswN3NYNm1LZ1dlUm9zUk9TVXBoeDFjNG9N?=
 =?utf-8?B?TWNVZUMzbGVtZ053UDNUVUZsdWVxRnlxNjE5OFRwejZuTW9TUzlYVEZpTmNJ?=
 =?utf-8?B?RWswQjkrTzRJQVFVWnRaaEwzcU9ReUYzbEFnb3JTaVVaL3RJYWRrZ2VTU0gr?=
 =?utf-8?B?d0ZxTEZYa01yQW1KTmFVN0l4bDJBU3pkd2xpcGVRWitDMFdEZEVGdFgzN2Iz?=
 =?utf-8?B?OXZoTERxWEgvSG1ZUmlRQ04xcjV5Um5HT055RVlyeGFzdFhIbmtPUDBYQ1Ri?=
 =?utf-8?B?UWlUVVY5WW9Eemc4dnNLam16RWhvT0xSaDR5RmxQRytMWGIxdU5HTnh0NFBZ?=
 =?utf-8?B?S21tYW5qbkc5RytybDAvNThkUG9GOG5TQjUwa3l1V3plclIydGd6bzVEaVBy?=
 =?utf-8?B?a1MrRFpOc0l0RVRNOTY4a0VmLzBlZUJWT2lkN2ZObUJYY3J6cnVSSWZMN1dk?=
 =?utf-8?B?VEZJMDNHVTdOc3FFbTFsL1o1L1FEenpTMThjQXdkK1Z6dGUrRHV2QUZZQ0JZ?=
 =?utf-8?B?cGpOUmhPL29BME44bWFtV0FBdXdOTU9UTTVHby96NDRvcVErMzhKY25JdzZn?=
 =?utf-8?B?TzlQT1ZOUEtWcnd2SjFCYXh2bkxvTmk5SkhzaWZNVlhGSGNacnN4WFRKMGdX?=
 =?utf-8?B?dUNXZDVyallmU0JqaDU0ZnpOazQxQWRQR0V5Z0dQMjBpWCtBa2JyaFpvbGZH?=
 =?utf-8?B?Y3IxclkydU0rTlhpbjRNTVJBRUg4VS8rc21DRU5FZlEvenppK1RjK3crUXJ3?=
 =?utf-8?B?SGlFSkhTQ2tvRU9DSTlObDZwcTJLcjBQRlVzRERrQ1c0c3gwdDk1WUhMbFdn?=
 =?utf-8?B?N2FrN1JoRVV5SmF5YU9aVEt6U01TVlFhUXAvTWNyclNJT3hLUzZnV1p2NjhV?=
 =?utf-8?B?QUo1WDZPWms1OUNtMlJZd05vd2pLYmpSTis0bDZUbEs5aGJQcDhuYkFQdStT?=
 =?utf-8?B?bzVkc2kvaXRNMTluc2RsQWZZRldyb3I1Ky9ha3piM0tWZDNpcFh3c2hRM2RP?=
 =?utf-8?B?ZXhjd2dvTEs3R3NYcm9ZdG55eEpzY3RSM1pJVHNNamgxQ0NMZ010cE1iZS9F?=
 =?utf-8?B?VWxrOG9PanIwTkt4dzE1dCtBdTdpclhtTmk2UjBpMTY4OHNZUkFnSWMyOFky?=
 =?utf-8?B?RGhUZXliNEhHcXovR3ZvOFVYOGwvQUdEUVZaRmNkVDBnSXBrVzZWYTBVWk5E?=
 =?utf-8?B?MHFVaDN4VGFwd3ZMallFWW1rVk1QVjAvQmFTMzBraldtYnBiaXVXSmVrVXNT?=
 =?utf-8?B?NVRLa3ZqdStpdi82M1BFekQ2QjJja201Zjl1SkloOG45YzNmYXovd2VZMHIr?=
 =?utf-8?B?ODNKclRKWjBtYks2UzdZdG5Ha3JxRG9LVkVTbDVuRjhpYzc1SjVEUmIwUDl6?=
 =?utf-8?B?Vzh6eW5IYjIzbE1YMnQrRHZvWkhNSmRFT25ZaG52QXZ5cENhSi9NLzIxNTBi?=
 =?utf-8?B?cGpvR05mUmxxMWlROVQ5bDlRUHNpaXVNT1RvUWNySCsyTGllZnc0UmpkMU1t?=
 =?utf-8?B?MXVpdmhUMHdoSThCK2FUV3hMMmg2SmU1dTd5Zm93bVU0aFdaRFlWS3YzazZo?=
 =?utf-8?B?SjdNMXJtNVNvTkUvajNvaUN6TTVRdHg0M2FGemxrc1JjZ1ByMnpKR2hPcHl4?=
 =?utf-8?B?ZGdGSHVyTkU1czRDb1Z2SFpLY3lkdlBSOFBtbU1jbUdKTW1ZOTBQSGFhbnhk?=
 =?utf-8?Q?fbLIX21gKIY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHdsdDFwRytkWlo0VExzcWV1Z3UyYmp3b3RDelRWK0xkWEZ0TWxSV2dtWTVw?=
 =?utf-8?B?NW4yeXFjcGlGazYvM3dkTTR6N3M1aTI5ZVdHc3lVYWYwYjhSeVVHdjlEYUQ3?=
 =?utf-8?B?cTdKdTFaQTdrVmYwdUNXeGZpTlVOMlQzbXRhWkMydmFmem43Mkdxbm1JVWlk?=
 =?utf-8?B?SHZqOWZHdHJDNThoUk5vTHFPYm05Y00rMWhTQmdHZEZWMnBIeEFCeSthYkdN?=
 =?utf-8?B?MDVlUTAvb3RKZzZGa0RvQUtXcUlpVWxOdUFaT0s3MUZVdUNUZllremduQjhu?=
 =?utf-8?B?Q3VyUzN1L1RKNnhBMTQyZGtUcUduU2daL1RyMWo3TlZscHh1S1IxaVdFNFJo?=
 =?utf-8?B?dTIzdS92d1JURzZicHdGU01ucWIwWmdlWmNCdHVtbkM5ZHlCY1FHT1Raa3Yz?=
 =?utf-8?B?T1dwU3NoMGlENjVXb3M4a2wxdVdnOXd1YVQxVlltUXA4N3ZCMHo5bU1VUmIy?=
 =?utf-8?B?MjAzdU54WTRNSkZsYW5BK01DNlkzZWY4WWplVjVqQXNCK25UY0ZBa0FZZlcz?=
 =?utf-8?B?SW5PQ1F1ZXRtblpNWEdCZ05DY0hsK25BL3IvNk9QV0luS0RRWDBYQnFidldp?=
 =?utf-8?B?VURwbmgyZ2NBcGlnSG5IUnRIaWpBNm1xR0tzQzR0K0N5Tk5YMHdLVXlLSW1S?=
 =?utf-8?B?M09HV2U1NlZZVEM0WHJacFlheWRrVWRZSG1nWFRSbUlYdWlvWlNiM1V4ZjhS?=
 =?utf-8?B?RjV2UU5zbysyUGVzNEtrbHpSaFpudkx5V2EvYXpPT2liTzlSeUxYNWREUDhY?=
 =?utf-8?B?MHZvOUpVeGEwVThJaHMrdHZpQU82aGVNNHdkMnROayt6R2hVd1g1QWNnUHNH?=
 =?utf-8?B?MGoxVFJUR2p5SDdabWFiWFhJQytvbVBVWWFTYStXejBFRHI0K0FweWc2WUFq?=
 =?utf-8?B?V2hRNEdFZ2ErcmxJcmxMc3JhOExxdjhaSTNKMWJXaGQza3RaY3lHUndjSVpm?=
 =?utf-8?B?R3BaQ1p1N09kdVU2QWV5cHZRVXAxZ0pUQmMvUnRuSWhLZ3R5Z0lSVTdIeW1h?=
 =?utf-8?B?RFhwWC9sSThueUxGeVJiaEEwTktnYTdsNnZ5bmU3blNqb2piVUFwZS9meUhv?=
 =?utf-8?B?aVNDaHRNSkZ0OUpuMWNrRmdxVUJsc3RWWW42cnk4NGFFditJSzMzUk1jSW1q?=
 =?utf-8?B?aWo5NFBreW83WHU5cmNUYWxzcWZXNzJRMnJjdmZiVnNYQmxjYy9aZjNGS2pS?=
 =?utf-8?B?TEE2NVc2Z0ZBRXZpdmNheXZjMkdQMDFKTGcvcWkyNjdEZEM0RmlaNnMzOFNw?=
 =?utf-8?B?V3krcXlrdDc3TTBHQitCWVBDN01iSzNGWTJOTVdsdEtBZnRDQ3l6NUFFRk5V?=
 =?utf-8?B?WUdkR1RuVW5ZRFhyZ3V5REVBVnRHajRNblFxZC8zK3VEbUVTakZsbGpNUXdP?=
 =?utf-8?B?elFkeThSTWpQMGl0MFhuY3VLOXQyVUVaaXAxeEU3NXpZM1liUGJCbzh5dTFE?=
 =?utf-8?B?LzVaRFRzWGVmV3E4aTN0K040bnEzSDMrUDVrckZTTUpZZG1qeFB4MFdqekpD?=
 =?utf-8?B?K3dpeHIvOWd4QXB2R1ltdlA5UVFJLzdSWWZTejJVOXI5UTdaUmdpTTBZVFJt?=
 =?utf-8?B?Z3hJNjZzTDFoSmpIUXhRMFc3SEhrSE44MFlzVnFLRWZKemh6K0QxaFJkQnI0?=
 =?utf-8?B?b09RVUEvKzBObE5QUjVVVmFPYmRSS3pBWThFYmU0REdRRTBZRGZVcEVGbnUv?=
 =?utf-8?B?TlErQmE2RUVzanpQUWI1MldIUzJ2Q1ZrVVhhckI5ZzAzN3o3aVl5SjNPcUF4?=
 =?utf-8?B?QkdCWnpOZmR3WFNJY3NJamFYcHBYamFqRWJOeTIyZ0pIREIxMW5HQnpiS1kz?=
 =?utf-8?B?VnAySXRLaU5IN1R1R1dzd0NpTEI1VGxwSXM2NU5LNjh0dEtHTUMzYmNQaG1Z?=
 =?utf-8?B?b29iWnVubWRTQlIxSUsyUVJLbm5ud0VTUUtFUnlUbmFYZTN4T01rRDNHcFQ0?=
 =?utf-8?B?QUpQYXE2S2E2NkUxSU8ydWZpYko0NFlLSElTMEdYTXlhVWxpV0RnS09GdkVU?=
 =?utf-8?B?OUxHTGs2bmFyS2F5UWxZSVd1Vk5XOUhSTlhUay9DMytnZXJ1enVHdEptVGF4?=
 =?utf-8?B?U2dITklPMHFLZFQ2Z0VOTW1DbTY3NzRHOTNpQ1VidHVIdEJ6QmRwVThYaThN?=
 =?utf-8?B?MFRzUWt4T2RTN21PcjNkd3Zxb3haOWJnVmlLcFdnV1Y0MDByV2dvZGVsalBU?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c0382d-c2e2-4285-6f38-08dd81bdf068
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:51:33.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP/JukV6IWhXsjFJP3e5O4xGlFzepgZSaQNRyrMYcovmfpWAInzRSdwPboKI4R6J3EZG4l6M4F21G4p/SkCQ5b0khDA+c5j9vpfM8ZGtplo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 16:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6775

Hi Antonin,

On 4/22/25 3:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

