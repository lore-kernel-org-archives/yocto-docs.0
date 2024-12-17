Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52C6E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:15:48 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.40])
 by mx.groups.io with SMTP id smtpd.web11.82725.1734444943959025904
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=G59rfuci;
 spf=pass (domain: cherry.de, ip: 40.107.249.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGNgbwqXHgb1xlJea69Sj27v5dh5HCoUF3F5rpg/YD1g6FUwZbHiwm3d3G61ze90DLn7uHjn20Xu+J/mkxx77AuQ2zNITRAMeipMcimU6Jn0H7RH24oavxvvWFnGguzCm6byemyXsLNLGPCHTbDnTcBQqK5HGDY0ov3trc0ngxXX1MIcDOwblfJRS78jTVY+gRyLivrS1VsVr3DJDPnEOqQWDN+eJeIiE7YIfs00adTcFQsAnXVVmYKz11JHVXgrgoeXN/rGiXJ8rt3q1ozyUY57zTZdABmP0ihOK8+aufUOjGtgas8xipkRB59QMUNoMuwP0W5WIAQdO4yZVzO+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3IB5oovqVoZYteeQA966dhyJ8BKV6RvX7Tx7Z/UafU=;
 b=ZJ91wSl73spGtegqUVRgj1O3c+Thy9T+nC7OsS1EdJ3Rc40UjStHUblH/4VGWj+p2Qqi9VACMyml3zWW2Y3fGgGsfOpjKR50XWkt4lM92SxE1+umt0f7V4ylsznT9I0X+bNxtIJFGIZDWx8AiNyPb08d59CcFmRDrtkjam3MnIC0jCvNOXOf/iOIse3shYuhVjAmiZydD4KYE+bl6Me6AB7jovengou7VkGLXlYKWQ0v1Uu4zQAeEcetJxRAG5qDz8uYKI76LUwFLCGr0pne/kRtuYX37/R8SSbdLB1c84kaMBXDPSNobM2CBd/v/o369vU5/NOTDV8TNdjHbKxHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3IB5oovqVoZYteeQA966dhyJ8BKV6RvX7Tx7Z/UafU=;
 b=G59rfuciQSQzezOdeRuKLNwSr644IIMJd8C+iF66ImAkEc33XD6PSiDYvN2mYy6LoXX9VqV8mMqRez8trO5yv21wQFW0gOZhnHFR04K8KCPpvK4RRFG16HPZAGYdorB4+v87a8vfxdM+srTk38l22gNKcN4MZJ4RSdgEu0nwplI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10745.eurprd04.prod.outlook.com (2603:10a6:102:489::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Tue, 17 Dec
 2024 14:15:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 14:15:40 +0000
Message-ID: <c489dc8d-a159-4654-b0fa-d338dd0a484e@cherry.de>
Date: Tue, 17 Dec 2024 15:15:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 11/14] ref-manual/classes: document the
 yocto-check-layer class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-11-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-11-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10745:EE_
X-MS-Office365-Filtering-Correlation-Id: a43dabc7-2e42-474a-be33-08dd1ea5497a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUdDMXl0V2xGZlZxZmFmWW5ucDBLLzRRMk03THEwc1JPNlFSNTFBdXJZYVRo?=
 =?utf-8?B?QjM3OURBYmhqeklvSjE1MnNsdFpkSlFsV3FsellMRWdOS1F6b0laZXZ1ZkhF?=
 =?utf-8?B?aW9aaWFOc2NOR05DeUdYQnczdkp3emV3TU1rYXY2b25EM1BwdUJUZVVpY3dt?=
 =?utf-8?B?ckZGMzk3dGN4Zy82WVJ2ZERDZnptNEtvVlFGamJvNy9wRVRJcXI2enIrZ0VK?=
 =?utf-8?B?WHFERDB6VVEySFBiclFodTJSU2UxY0hReGRVSmZENEZYNFlxS1lnc0lCQk1i?=
 =?utf-8?B?VHRRV1VSTWhJcEZFclJTWUpLbzM1VisrcTJUeHliaTlValFOQlFyYWpIYVJm?=
 =?utf-8?B?dGVsZDJaZS9sU3RNa1dybElVTFlZRWl4YnVnWEtERmdyWCtrVk43dzJtdmxP?=
 =?utf-8?B?N01aeXdFSEE0NTJnSHZqM25tcWM4d2JRbjczTnhTdUlMaXZJOHlUbGN3dUhN?=
 =?utf-8?B?cnlwbXh1MWdUUlRPSmVSODFnZk5ZaGhHRW5KOVNZRGROUnVuVFZ3cGY1TXRE?=
 =?utf-8?B?bmhUdEQrUkVrMlZsSXo5VUUwU2dGV2JmeWZoQVpKSGVyOGsvbWpsMGV0VC9l?=
 =?utf-8?B?SVh5cjlCc0k3bUhVMWtWTzJDNzZSQ2N6Vm11aENkVjNHakRZSjBIM0ZQdzJq?=
 =?utf-8?B?dHY5TXZQOUdoQ3NCSDVZbmg2K0dBOWRlVUlaS3VwK0U1TUJibmpQTHcrSGZF?=
 =?utf-8?B?TS9MWjZVYkVMckdWejkwbHp3ZnFKdVNKNlY3WEVtaE5FdUNRaDM5Vk1CRzJw?=
 =?utf-8?B?UEE0RjJBOFF3WFZOSWdVMmF5dWExRzRZcnorVHMrd0FBYXlxN2p5MnVuNVY3?=
 =?utf-8?B?VlVVaElERGgvRnNLa1hvNytoQjhVRTM4R1JQTTBLV29WN0ZxVUhhZWEyb1RO?=
 =?utf-8?B?NjgzYWtWZDhQdjF4U29sT0k0VC83MVN2V1pSZmhwOG5KczdxMHczaGVGb2wz?=
 =?utf-8?B?WGhlVUxaaXlSWC9oMERTZjZTL1l2SjlJY1lOUDhtdVRpM0xWaGJCbDd2QmpI?=
 =?utf-8?B?S0xDa2hIR1RqUzkvNk9ZV3FEaTJkMTMvaUtwTk9LOWFBeE41ck90bVptYXp0?=
 =?utf-8?B?bDlhUXRldkZXZUJWUWlZQkdtKzFWbzdxU0Z5QzhlSmRUaU1uRjJWOGtHWks2?=
 =?utf-8?B?NTUrRkg3VkZUNnZLem5VWGpJVEVTbkNUcjk4VjdhMzRlY1BqUWt0WmVkbDlW?=
 =?utf-8?B?K0R3bVI5MHp6MzUwV0tOOW5rWjZsbDgrNjl0NlFXdm9lYzNMcFNnb3dnb0dT?=
 =?utf-8?B?dTVjTGxvMXhNWHp5REltZFFKaythY0w1Sm9wVzFHNGR0dTNBclhPZ1NLVktp?=
 =?utf-8?B?ZHdsSjFWWGZiTEUyUGVZVkF6Y0d6eGhEWHVLc25mRzl6RzViWDNIRjNuSG5r?=
 =?utf-8?B?UCswdnI5OUlRdWxWYy9RY2F0cDdqM1dFcnByaXN3d01YMDUyamx0R3JuT1Fq?=
 =?utf-8?B?TXhvV1BSSFcySnhJNTZrN3ZKbjhIaU9qeitHSWRYTjV3TmlHTnVnNVVsdmtB?=
 =?utf-8?B?VGZYM0FHOXgwYUppTkNLWFE0anBPcjNuQVgxOU1UTTNsVW53UXZacytML1Fm?=
 =?utf-8?B?MnNhTWhBZEV5dU1PMGV2SmNzQzlDZWY2YmU4aW8vVmFRTmpXOFJSdEd5bFJp?=
 =?utf-8?B?TjU2bjgyZlRPNmEzU09VYzhySXp1aDI0RUVoMHJyMytrT1lpZVh0YXFkaGRF?=
 =?utf-8?B?ZnFmT3VxL2orK0RleWI4RVNvckFhZkdoS3JXUC9MTG5wdVpnNkVla3FtVURV?=
 =?utf-8?B?VzU2aFh1RnFDQUhIRWVETklGcGExUlV2dFRLajB5NjI2bFFnSEpVYTFuQ3Zl?=
 =?utf-8?B?SUlQN1ZZUmNCY3JrRnVSSTZVTDUyV2kxb2wrR08wcXVlaWtONHQyelgybFVP?=
 =?utf-8?Q?P2qwll2m7tupS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnA1SG9IRHNvTFppZCtoVXBLUkJvcjVEZ1JrVDFMYkFXSml5akJQY0dtUDE1?=
 =?utf-8?B?ZmQzMk80UVpEaUtKVWc2WnA4bDVIYzcrZXRGU3NIckw0b3E1U3hPK29taEpy?=
 =?utf-8?B?WEMzWkhOVkVZNkcrbGFoY21ibk5oZUg4QSsyM09scDVZNzBqVTFsU29vdXZP?=
 =?utf-8?B?d0YySXRkZS8yVVFjOEowdUdIV2J2bWdnV2JqWW5CMlRDMC83cXNqSWI2WUxp?=
 =?utf-8?B?dklkSXFidHFnalJVWXllVi9UZDdXaVRhT1JJdXQ3TmxjZEJNNDFsdjNuNFdo?=
 =?utf-8?B?K1ZtdFk3eFd6MlovYWl2SDI2SFdleTExSFdXaXVaS1Mrck9uTGhUb2oxaHlj?=
 =?utf-8?B?c3Z3QWlwYUlYSXpZMGp3QjVSbTQrYjBIN1ZmY2w2QUc3bUtBOGpmZ0JuZTZ5?=
 =?utf-8?B?NVN1dUFNdC9BZ3d2MnFVMytrY3lJRVJVSERlY3ZFNHgyYkJSNVp3YmpJeE9k?=
 =?utf-8?B?SE9GZC9ZdVlSbkFmOTE0a0E1ODR0eE5aRnF1czdxRDd0Q2loaFBFNUNuQW5F?=
 =?utf-8?B?TlM5NXVFZHFBZS8raFRZMXlUcVJxSW5IeDQyNFh3M3prQ3lvanhxY0RzNmZk?=
 =?utf-8?B?TDl4RVJtVERQeWRrc01MWXVRcGkxaDQrMk03ekZBRk1yZThzeDVoSGJWZkNS?=
 =?utf-8?B?dFdlTDcwZEYyb0J5SGRFbkk3NHhMSFZuNUl0VXloeHhSa1hIdktUMXdkNmFM?=
 =?utf-8?B?WUZxbmRkWUVUK0tFTmhpa2lHU3lLblZsOGFaeEpuMzE5RXVLL25jNGNOWlox?=
 =?utf-8?B?bWlGcmJNRS8xSlM1bmxybC9wNW93U3Jqb1c2eHQzTDNSd0NnWFRHWWRsWWJv?=
 =?utf-8?B?MkxnUHNSdWg0QThSdzl5Q0xLYmdZcThaL01RWUozbHdZZmtPdnpZcmpzRGFI?=
 =?utf-8?B?NDlHWjZ6Vk5kZ2VYT2ZnSGU2TThsOEJlcVp1ajRWdHQ0U01ZYk9XQWozR1py?=
 =?utf-8?B?Z1BoQ3R6b2xWU0EvM0JBcE1ZRWhCUktKbW1QOUtGTnhra0lMTEQ2MUVTRldG?=
 =?utf-8?B?UG10RWFLY2RCYW52YkR3QUVzeGVaeTNYY2N2cGVPNzNkd2hJSllpOEJaL3hI?=
 =?utf-8?B?d1hFbEV0NHkyVENJZlFCdUxqbVUrRU9YekpRaGhPNnFmVlRvMzd0R3g4RkFF?=
 =?utf-8?B?Y2QrbjB2NmFiK2FZdzdxbWNBY2ptcFV3bTdXakVZRXRoTDlUdklTVmExZTlT?=
 =?utf-8?B?cW0zTnFBUkxkeVVOTXBFV2U5K00xSUVRbGJGOXJTUWNVY1o0Sm93NWtoZDJM?=
 =?utf-8?B?VUJPQXlic0dhb2IrekNHa1M1UldSMEpJd3dITHUvbHUrUWFoWkNOaG9PUmli?=
 =?utf-8?B?S1NKK25KZU1TTGtZYXVDbVc0VVF1bkxKSWVzdkduMVpDWlBtcE5pUE8yTzc3?=
 =?utf-8?B?WUVkRXZoQzRoNVU3L0xlSVFFNkJ6bGRKZG8zUU5aU2grVGx5UHhiczQ0VENU?=
 =?utf-8?B?ZjZURGtCU3kzMEFiK3FXWDVabG00ZDlWL0FTSDNoTzZhdVpJV3RGd2pxa1lh?=
 =?utf-8?B?aXF1bzZpYk5qYzIraUZZQVU5UHU3WHRLTkNoT1Y5KzZDUGR6cFhKZTRXcDBT?=
 =?utf-8?B?VU9FTjNMa05BM2VUeXdhNXdYR1cyVnNRZkRhd1FkMjl1OHByRlo5ZWlQMWZS?=
 =?utf-8?B?Q2h5VzgxWGFRdG5vajREM0IvZWJOTnRKV0dVR0xpS2pYSitERjhnMHVRQ1BJ?=
 =?utf-8?B?UisvNG84Yi83L3dQYjFsVUdhRXJ2V0RsaSsyVDZITXF0Z1FQaDlUbUR2TGVF?=
 =?utf-8?B?TXNYaEI1UER5RStWdzVBNFF2L05jNlJVc0l2ZzlHaDZpaFM4aU8vMFB2R3R1?=
 =?utf-8?B?QjJpSGtNazNhbFlIN3gvWDV0R3NBU1RaYWkxSjJWVjcyQ1BDU3JRcTJ3WGUv?=
 =?utf-8?B?TVZ4VXZ5ZTB6ck5FMEp6MU1PTklwUElWUWRSVTk1VXBqL1Z1WkFwUW1jT25S?=
 =?utf-8?B?UnNrNm5wR0N0TEZVbk9mWkFSYzBTSmpnUnVxMlZPQUVaUEY3NG5HeE9WOXNK?=
 =?utf-8?B?S1FlSG00OFFQZ3pYSTNEeGZLN2ptajZkM1V5VWIwMlVlOXNNN1BiS29kdktM?=
 =?utf-8?B?Z0NZZ29Wa2hTS0J3R081WFlNMG1MZ1BYSS9ONWJYUE1ORVFKK3NIdHVsaUk5?=
 =?utf-8?B?c3FvenlsS0hSNEt3ZjN1UEFoVWx3RmVZN0ZsajhiQUhmaU1ZbzhMREZvQUwz?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a43dabc7-2e42-474a-be33-08dd1ea5497a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:15:40.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbV1ddv2MSZiCBgLLnuiDmVeSvd4i3qlRMYkS0t+6q37D2CTIx6AftyPXcSY+/Myd8VH5xRJjs5H2Vb7ZL3AGHU9SRtQT2Pef728NMCa5uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10745
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:15:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5967

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This class is used by the yocto-check-layer script to check if a layer
> complies to the Yocto Project Compatible status.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

