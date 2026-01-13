Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918EBD2D0FC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:13:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58496.1768309977001630599
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=D6rlfCjz;
 spf=pass (domain: cherry.de, ip: 52.101.70.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAksEf29oPeKW8lIQZvK+s+C32T2M9BZs3mBZeJZVSoOT12VL4A5OikV/RpepMuEsRL09VGk9r8IW++Sy92rvCDUoZENQwrqv9XY9FEjk5+Y02vjPZyR5TYS01m8dNSId3OagX+DS3C6a5Ds9Asu53MDJgWdn2jvmplh/SJB8mjNlExYqMXvWAXwbFcm49ngM7Qh9C34sKof1H/oH82V1OAwjn74EV0MntUicjr0wJTUaIq7Wn7/wrZ1R2T6aaf0E3TG+MuK942bN90TLWQP7lRI8ijwgLbodjP2wdQ3qBYcCWk4Eelu0jOn8dWZ7o8ziWiRgFBco0n5eB4Py/SxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=xGd8rQBu6Qlib8Za618qY2kMdegTU08f2A/qK1x4WqkwQkGVDjmULtIV9hTCf0QVBU7/pPU4vvnxENT2WEQpv0V8cLRe0eZpCJ0NJKQxNSkC1SN6yKN+Ie1dK1ctVB07MiNFjMrAS8ZJ4uD56ESLjAA7FvVlWNJQ3jrSBSp2nIg7a3XdnRYMu5AnH/WE9USzpu4hH9P5Dhr8ohDyhNCov5nEoTfVi3SlORAvlkLLKwNXZFAp52lrYr1KtmpHw2z0myqc5ig53T0ZWbdUnXCKjxpfT75V8Q8YLRAmkcu2Pf5r26NE4UF84Ihs5/irt7Ai224BrBTW89WMEZa/ZKNSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=D6rlfCjzFb9eZP/NnUVvahr8NfBlFrh7fY0O5wJwkuHvP4+v3KFLWI7CgO0TJrFDZFTz9Kf2bwbBwHtQ2+Up+NLxpnWuRE49N5VzY1JhYV8yZrk2wc04ED5tOEQkxwjJ6PFNd/oq9HWitKx7zCKc2/lFXkB6Cc6zjLO8r/yRnzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 13:12:51 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:12:51 +0000
Message-ID: <f02f5267-0c99-412a-82db-5644088745f1@cherry.de>
Date: Tue, 13 Jan 2026 14:12:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 17/53] dev-manual/wayland.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-17-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-17-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0073eee7-ea1b-4872-f5f8-08de52a5747a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3FEcVFSbThuVFBVM1JqNDVoM2NVQXBxdTNLYTJObTB1NGd0YWZRV1o4NDV0?=
 =?utf-8?B?RkNyZ2RBMlk4Ukg3YlJIc2dIUXZ4OW11c3RUMzNYUHRMc2hnM1djK3NoM1g2?=
 =?utf-8?B?aXJ1bVJZNlVJTjRrK2ZRSTRuL0t3aFhha21IYUI0MmlRTHdBTi8welo4ekhB?=
 =?utf-8?B?cEQ0VGtVWFZhbEdGRTByUVFoNnpqZlpFQkllUDZsNWRyUk9wVE5tM242U25W?=
 =?utf-8?B?a0JTRXdFQlNQaW92SFpUMTBYbVYwUFFHaWt1VEU1WlNPQ3hVOFdoTzZmZXN3?=
 =?utf-8?B?RmdHM081SVJQdTdHM08xZDBZbmtrcCtHMlR1WGRmTHBHN3laai9iSVMwVWxQ?=
 =?utf-8?B?ZzB4RExOK1BtVUNhVGs4eVlYeVBPZWdxMFFCalNqOVZkR1NUNXlVczg3TkNu?=
 =?utf-8?B?bkl6SGY0M1M5dWYrRGJDM1o1MkVRbHlOdXRVdWdxaGM5S0l1MHBsWml3ZkZS?=
 =?utf-8?B?WFpudTl4S2RwMWJHMEVwS2w4Si82TUVKRHlRWWV1NHpTQ3ZrbVVFQ1JrSHpn?=
 =?utf-8?B?Z2pPdU9HTTZWQndrc21uRThCb2NnMXM0YTc0T0hNTnZzRkRCNi9LajljRjRX?=
 =?utf-8?B?Nm1qTkR3QkFiUzhGbS8wci84UXlybnVTZFhtcDhvV0JUeXBNSHZHT21LK3hz?=
 =?utf-8?B?V1hFcld5VDFoSGVxYzlUOXlMSGVxd0xCNVZqdzlreVlIbElZN2hTazZvYnFN?=
 =?utf-8?B?YWFGa2l1OHdyV1RLTWp1UE40eGM2bnh3a1QwUFpraTRMR1V6U3djak56MlRS?=
 =?utf-8?B?VnIwWis3c2J4ODd0MWNzbXIwMGIwK09vS0FtUjE2b0IvQXBOZzVoenpqTXNq?=
 =?utf-8?B?eFdoMnZqZElIN0sySkZ4ZDlrT0VFaTV6TXc5TklGK25qaG85ZzB0UlJsR0Ro?=
 =?utf-8?B?RHVZMTBqNWhTWHFQZGJCdDFkTVpNMnBveDN2M1ZUUHVXUFIvT084TkFhMHpU?=
 =?utf-8?B?dzZCUWV2cDBJcDZzYklVeXBzTTYwbDcyb3ZiWHROdVNKaEUxR0cvVk42TkEr?=
 =?utf-8?B?UG52ODBVN3ZkT0QxWlNyVTdZbkJpR29jUUQyczRxZFFGTjJXNWhnQkRUQnBO?=
 =?utf-8?B?Umlna09velkzemF5VExvY1RPQkEyY2k3QmRxYnJkS1crU2NPOW1ZS0FzZExG?=
 =?utf-8?B?Q3NkeWw5emdqUVZ0SFRVQWIvb1RNTEs3YTl1b0ZVRUZtUFBHK1hYd0hnb1Nu?=
 =?utf-8?B?eHcyR3Z6ZHBadW9HODkxa1QxODFGUjJ5QlpIZGd4SWdYQnJrbzRzQVpQeWZV?=
 =?utf-8?B?U1MzSk9idGdDY1NMTW9hNE9ubEo4VUVOejlSNUZjU1Nyci83TEx6OHpGU3Ay?=
 =?utf-8?B?NHFHRmVkRjFmNmQ0YTA5ZGhpUFpUUE9WUlJRaGUwL2JHcVZUaW9XQVd1R3ZO?=
 =?utf-8?B?dHdLYytSdjJNbGtBNUVvZDFFNUxuK080WjlDSUFLL2l3c1VzK2VMVkJNTWRO?=
 =?utf-8?B?TGlycTF5UkVpQXB5T1lPV0F5bTNFNEltSk4wRll3a0hvTnhiMUVxM0MybTBW?=
 =?utf-8?B?OW1XOGVoZFYrQVBtZk1NYlppZ2dkbUxwRU5tM2xkdnJpanl2aHFvNGVuUVJ4?=
 =?utf-8?B?STNCYnVIdkh6RWhpa3o3T21nZmJWTiszSUp2OGg4cGNyTFRiZWRGK0VFREti?=
 =?utf-8?B?ZG9YWXcyVWY5QWcrOHB1Mlc5TlhJaDBzS0hMNHNMTmd1WVpqc29seXRUL3JP?=
 =?utf-8?B?ZHg2ZEdVaFZhQUlwcVQ5aFVRZEpHalNSNkZKUnFlMHB1YlpOREkvQklrNkRx?=
 =?utf-8?B?Wi9MejBBUVlPc3VRVXlqU3J6eGpSTFBzZ2tTYXhKdnJzUjFmN2FJQ1JaT0dk?=
 =?utf-8?B?enphZmZRN21tdlNEMFVsWGJTT1Nzc1BOaWpvcU1LMVp3WHB3eUZ4aEtvSVFn?=
 =?utf-8?B?bEtEaFZZbktWKzFsVTBDazNiVjI4MmhoeUlUTXYrSGpOazkzREVVRzZUb0Qx?=
 =?utf-8?Q?pTX6/EO8PbPASTkT+Dgis9gn+Xo6ZARl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmZsb0tDaElSUTdHMGpxazl0N3o4Wkh4RytpdkhKc0JHdGg1WlQrM1lTTkdn?=
 =?utf-8?B?TWlDVWttSFZhTnh3TDBnQnliUExwRHBFQUQxNXZNSk4vc3ZiVkloaTBwWUhP?=
 =?utf-8?B?WTNxYWlBVk1FcVNNUkpRYzloNHFTakpsbnFSSlExbmZnWXY4S0psUmVPZU5R?=
 =?utf-8?B?bG5wNk5oaDk1NnNpaVRuT0ZTRitKN2xBdlZId1p2NXVZQWNlOHVTemRhR3Bk?=
 =?utf-8?B?QzR3QWtBV0lDU3pCT0RNUjdpSUd2L1RCTUJQUVpQWG9ZWldCWlRneGRRVS9K?=
 =?utf-8?B?RlpwMi8vZWw0UTF0cjRBWU9tektiVExzeG1YUUg1SEJKMnRyNDB6YzdIdkZN?=
 =?utf-8?B?TFVPcG9TQkgwY0dsYllpVEFhRUYxeFJxditkV3ZuZjlmZktoZG1mZ0hYUjdS?=
 =?utf-8?B?UzZRcFlwck5OVXUvOHZzVWV5SU1mRVFBMFBveFJSaTZTWFh2R3RmT0d3NVFR?=
 =?utf-8?B?L3FzV09uSDFNa0pCSkZQeSsrYS9wMHpiQ2dRbVBIUEVQVHQybUJYMk5kQnRV?=
 =?utf-8?B?L1dCcGJkSVc2ZnBUc3lINElUenA4ZEV4QUloenBOZEEzQjUwNGFZdUg5N3RR?=
 =?utf-8?B?VHVMTW1YbXNvOHE1aVJzQ0RkbzFQY1FzUFVkVlZ0azAyVUNUdG0zUUFnU25j?=
 =?utf-8?B?RVN3R05QUTNqK3RIemJTRHUwSlpWMWpsdjJtcjdDdVoxcHRIcHFPYUZUUlls?=
 =?utf-8?B?QmhLb1p1OXVNb1BQRmtjbFNoOXFBODAySU1mSzNUQ3NXNUZoK2NNcnltbThC?=
 =?utf-8?B?K1dTV1JhZ2haUUNUYVU2dWRuajg5Rmo0eUt5a25ORlJhSkIwNW92aGhOSXJX?=
 =?utf-8?B?R1JleDFtek81WTZKaGFMckJlTUJZUVVsV0F2c3hQSHVpNkMzZ21CTi9NNlIw?=
 =?utf-8?B?REJSd0c1SU9VV3pCWGtRczlqU0hFclVUTzcwQzNqb1hNYnF5QlUzYStJMVVV?=
 =?utf-8?B?ZTBaZlpLWTJZL2d3SGhzNnNlNlpNSXpwcUo2bUZKNVNXdkRnTzRZVWt3Q3E3?=
 =?utf-8?B?c3dVMnpaSXBGV01vd3JiVXQ4WlBSS3pNZDdVV1F4OFFHRmFVSzJ6UTRQdFVx?=
 =?utf-8?B?aHdIVkg4ZnJKa3Z3YUI1a0lUL2YwNk04TU90eENKdHAySlBPbFVndWFISUZu?=
 =?utf-8?B?RlhmM1NrdlB6L3FmNGtDcXJPblYrM1RLMVlIcm4wWEZzandqaWxCWVl6UHhU?=
 =?utf-8?B?SUZYQUNuaWJBL2xQU2FKamR3SDZPV0tLL0w4SllBRHAyMkJBeS9hOHYzY3BQ?=
 =?utf-8?B?S1ludlUwTHppaXNNM1RhMXNsS3BtWW55eHRic00ycCtuZ2VtYlNtcmc0RzdU?=
 =?utf-8?B?K0VXdC9POUd4d29sQTRhU0U0VzFOZk1sR2lZL254TGJUck9yVGdyY3NGRjdj?=
 =?utf-8?B?THRHM1BWd3NzaGdjSXQ4ejV0Vk9UYk9XWk10WERRTS9DZm94TGtnUEVpSkJx?=
 =?utf-8?B?di95OEx4NUZaNmRYQmx6ZjF2TXZoNjVBOWlqWFV1MlhXVVFLamR4THBwdzFo?=
 =?utf-8?B?elVuVjVmV01SMlpEWElCSE44bUxlbkFzVk95RGJ0eFE1czZNclhwWDlCSzly?=
 =?utf-8?B?bWFYa0YwVHF5TDhPeTNLUlQxV1VZYk9HUEMrMk44Yk96OHVGZkVTQWx6dmpO?=
 =?utf-8?B?T2lCNklnTVY3RGhSY0N3aWZha3JCNEt0aWxobUgrSnQxdnp6Y2EybCtCUmU0?=
 =?utf-8?B?QUdwNUE1Z1BvNHRjSExIQmFjM2dkdjNEVjQvNzVDYlppWnR3QkNaM2huWW05?=
 =?utf-8?B?cFA4azhSQTJ3bXdQTlhlNGZwMGovcUNUbjlDSks0bklPdUpraCt1NVlPSy9O?=
 =?utf-8?B?M0swYUFlVWpQa2RjaEk3Y3ovbmxRY0FMWWcvODdmM011VTJaUExGUEpEbllj?=
 =?utf-8?B?RmpyVFl6Vkd5UGN1YTJKR3MxenhUcHJUL2hKWFlUSjNrU1U2VEM3aDZaLzhk?=
 =?utf-8?B?dnNiQlhHU2lPOCsxRGJUN0l5WGxqNm5mKzhSQlZ3U0ttaVBTc1hKb0gyaHdP?=
 =?utf-8?B?OFh0bGMwZmNqbGlxNGd6NGhhblJQOEhnQk1idFgwSlp0RTE1L0thNnZiNmc4?=
 =?utf-8?B?c3ZZOWJsdnh4Qm1jL2I1T0FDNFNLTXJ5UVR2RGJpZG5DOGV3QWp4SGJDMkho?=
 =?utf-8?B?bFp6TkRvbGFWQ2t0d25CdkZPRVRvWUFGbVNxWWVaVk0xQlhmNHduWVRGZkQv?=
 =?utf-8?B?OE5CYlNWUW9IWWw3WjVMU1EycVZtcitKZDN3YVJQOVlhak1GMVZNMk11M2VL?=
 =?utf-8?B?QWxzbVFKenI3SUthekVDS29hR2QzdDJ5cklHdGpiMUxxOUlUTWxLNmpIVUVP?=
 =?utf-8?B?MU8wUkZiSUZFZU9WOWNNaTJiVmNxYVZhcDVVQUY5TE81SGQ5aVR0Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0073eee7-ea1b-4872-f5f8-08de52a5747a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:12:51.1755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk6svCq9KEHEuI/vbYyve5PnR9qyqlmjiLly7gf2PosUiOpTvsDMoLFnj+Ji27l1Xgao9pZKA8nOL/OOOVg3YRKsGcuLLofUBRnVNCh2fqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8506

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

