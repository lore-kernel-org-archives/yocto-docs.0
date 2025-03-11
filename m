Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D459DC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 12:32:30 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.64])
 by mx.groups.io with SMTP id smtpd.web10.7634.1741696348683811297
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 05:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZTjjWe0M;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZTjjWe0M;
 spf=pass (domain: arm.com, ip: 52.101.67.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N1OFj/oSp5fuYr1nevTkFMG5c1pSvB6zWEXpWi8bt4f/kc6EamCTlIv2S7J//Z9CYwHq8sjqT1hmYNAE/lezHCNrpw0qOxO5A1YnCCakV9Id7v4hEkTLH//yw8UpVImVKvJIbx60wY4bf/Omc+VFpAoIePMuU6cBrs7BF5Uw5EtEhoOnPg7k9NEsKb5O0HIkQRP28ESo4l60tg7cSJbV7pKgiRr0UPcrcMWv8JAs7ix/eOfV64pDpiXrE2pnVHRFXMgNHV/9s24xRanJ0jorXQ8ebMirYZQAkOgaEO8zsBFfHUspkn+HSKqUvWgDtRW95184ELcw8PaQBCh189a3RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70H0Q11aChMFYgYkeZc+ZpL+kTK1FITvBt9RxLy9rlU=;
 b=akmAlAeSsFRHKis1YSMoydpZYlHWC7iiBKdDUfTP61Dx621Dtiq1zIqcvdoRrlssnsVPLhbCy9LG8Icvl0KDk8ezZtPTMHyzhDNPU7MU/KKZRd8AMD4yCwpfBhf1pAI7joThx0ZQbCxYtSQNVJy4ZTPG5EJkjAB3HpQUip8SvIGVvkDcuRkpMe8Ag3tzJD9bZNiht6V8wSL2X1mfwZpbljeaMk9oxWId0cDF5rhEDelvH9q6YV0cTXU09NGMfC6lpODk/QEgG6cg9OCTpczfQq4l4RIHCXi1mzQyacd8NwguoUnsPv0EmD1tJ9Pj0fdEMNkEcq7bPdyEUt1+hYK+bA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70H0Q11aChMFYgYkeZc+ZpL+kTK1FITvBt9RxLy9rlU=;
 b=ZTjjWe0M147yv9AdbyjQ1bJg6s1KiBg1gEPklzq9503y9dTAXrgjVOSb1Z84scu9Il9FgMA7uw4vKFyBI5OT8tQdbsu4R7BR805bDF1/kmj7OAjIMiM3uOirXp+oFvwlROnTJyrcQxFQfJl/s9yvjTvRY3tkwdVEvu/2o8RtJcY=
Received: from DU7P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::30)
 by DBBPR08MB5916.eurprd08.prod.outlook.com (2603:10a6:10:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:32:23 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::f9) by DU7P190CA0002.outlook.office365.com
 (2603:10a6:10:550::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 12:32:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 12:32:22 +0000
Received: ("Tessian outbound 68993334049c:v585"); Tue, 11 Mar 2025 12:32:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdad08facb14aab0
X-TessianGatewayMetadata: ZKrKFES8xS0073L1tS09gq38KocB4Wxf0onX9bG1+BuAgZ7VtR14H3ptaZUPz6iQ6QPBFDnbcRJkI3tMmCpFbeSQN9fZ9CTm6s4vGQ5lnXWjRX7QTuxAmABGMrQPYDrW24kv9qVlNm4df3+L1ZvsdWnvdgi2HS0C0NizSShsqB0=
X-CR-MTA-TID: 64aa7808
Received: from Lfca398602168.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0B696868-F534-4141-B359-6B53EAA9D46A.1;
	Tue, 11 Mar 2025 12:32:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lfca398602168.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 11 Mar 2025 12:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJsrVyBYB6EjNBYJd5p2urwNpunpIh1atHf84pPG1vK/ffkPiDKjlOMMvG5zWZUP0dn1u1buD9HtdHE/mvR2yL/U7BVuJLiefXmzQ4iBH6BMXAyGflcDWScimHAcQNa7qJfJOaO9sLkFtH08QHFQ7HhHgwk/d2mdD47ZLLYW0NndGZGa4+8Gnr2z8fZpLuqY3WbBpSiBcwxmLV6EzYkRUz0uHqz1JVNUNO/ugtMh5POTK/4yJvgjzmI3vhswUP/TUiSNuvORXJ4KJOvnnQdFLUcu6OF7uOalWzRKxSiUkVfERMjEBQaXDFLxI52Pj28yf5nlErkOhYePakQ09Lo2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70H0Q11aChMFYgYkeZc+ZpL+kTK1FITvBt9RxLy9rlU=;
 b=JydvrIQ4T+kA67f65Gadu7VHMfVGgHcw7Jt+psUrSlX/NkulUUqW/Bee3Ya6p8FqM+dc2+w19TnpCZ/i6sE1nX7gUbZmR9q/QeFrOZYUEtNrYBg8i0qFVK2E57mjs2Cw0+jrf1N57zYaNTGmcHuYzpG0SDplgVD/70XowAXzckbgIFrWAFRiRu/KW8Zd4R//smt8tU1T8tKwy2ssgDEOBymuGs9PDGlHC4f0cAs8XHM1G4CI0jbFcIecIFxs78Isi9qwiFvmIGhFJkAd7eM60oWpRMtW7LM8emBcowmJ2jLA2SZwTPXuo8PtYPWTI1Uku8UF4IsHrFYfcJErR2tqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70H0Q11aChMFYgYkeZc+ZpL+kTK1FITvBt9RxLy9rlU=;
 b=ZTjjWe0M147yv9AdbyjQ1bJg6s1KiBg1gEPklzq9503y9dTAXrgjVOSb1Z84scu9Il9FgMA7uw4vKFyBI5OT8tQdbsu4R7BR805bDF1/kmj7OAjIMiM3uOirXp+oFvwlROnTJyrcQxFQfJl/s9yvjTvRY3tkwdVEvu/2o8RtJcY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5647.eurprd08.prod.outlook.com (2603:10a6:800:1b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:32:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 12:32:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Antonin Godard <antonin.godard@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
Thread-Topic: [PATCH] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
Thread-Index: AQHbknRIuVMwO8byT0qD5mVJ/PeHgrNt3kUA
Date: Tue, 11 Mar 2025 12:32:12 +0000
Message-ID: <9C44040B-29F8-4274-9945-9C0C2A79D909@arm.com>
References: <20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com>
In-Reply-To: <20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5647:EE_|DB1PEPF000509E4:EE_|DBBPR08MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ad8c0f-421c-417e-c4d3-08dd6098c5df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?YyPwpeqSeNGnmiQSFnNSMyoTa8HLeXyWCIuROYC5cHmDETsuOOEyUT7S+jPL?=
 =?us-ascii?Q?ReNctiB+O03067RPnY8work5PzewIW2gi9gdzAm3Z/XEKbwyfOtbCM5WTnTe?=
 =?us-ascii?Q?ahTfX1m4hpqLgPBf3R/pCLBr4JEsnxYwji61iug/eNHpWGsnQ/DYTdkupAmu?=
 =?us-ascii?Q?iCFCTf+w1PlziNrWsuFJo6/cPsXe7RtaIIWUbVrF67LKnzYaWyQoFZC4D62t?=
 =?us-ascii?Q?MZj1a3NJGPx8a7yDcclREMKxoaRTL0yFDoPiwtIH0FcwDUWIzHGdyrR8C3He?=
 =?us-ascii?Q?xN5yreD9kgWEKIm+3K9nZ6HRvKbNHqxvr+5vc83bFgUDgHvEO30hAzCjtgyN?=
 =?us-ascii?Q?FfPnDMcKbZO+A4Y0WnR+zV5Rs/1ij2Gt+35mg/8tVg+8lf+//Caxdjtqo+cX?=
 =?us-ascii?Q?gKK8lO5JWuwM2ai2yDFZhRw6DJOaUSg9b1BtQ45unmWWi+v9jkJj1G6CHjvZ?=
 =?us-ascii?Q?BS7flVKBGLKhqG+KEc4ejfktIJ6e9uUy2J5hRKd7BzsOBffYq6csGQADC4p/?=
 =?us-ascii?Q?sBBKffjJBSYXUZcl66B6papZR1KtUQEdp9gkvhtsiH+BWUo/LPUw5asuii57?=
 =?us-ascii?Q?IZmksrB+DkZJpry8R9nhGw9jZPJYgpjQLmC7lfx38FSOz9Vx+97QbZ4QoNiD?=
 =?us-ascii?Q?+1NUVB0E4xY0vC0Mcpz7Lzlf2+PvPvOkbh5oeWcT+ckzDn/tX/yVoHtaODA5?=
 =?us-ascii?Q?Oi2w8wz5N52NC9n4WQWpoB5wmG1tsqMfOg5scmd6qTtBKGlay4GxF+/OLylg?=
 =?us-ascii?Q?9OHBDAzHzQX3262RrK3Y174nXQjYnGDL0godMLJAsB0oRiMZyJRc8ZXOymTQ?=
 =?us-ascii?Q?ayzexcFmmmox5O9WApWkGK0t0fRZcc3fNsDSoDW5aMhsRYsWKLXfUjApNn0U?=
 =?us-ascii?Q?3C3LdfxrMbPVM5b9YpjPL6tYiwCUFRPjvueVHJjRLMmB1zQXGtIAC2WKUZYU?=
 =?us-ascii?Q?ph7YgaZZvRkCiOz4nEyR1UIw/J6qurgxRM34C2VsCeteFGAofVU89/6pSjYO?=
 =?us-ascii?Q?9wINs5VFxrbN7i0A31PfuWxlurPjnNABlhNgKzSI/d3ly0cRYYwCJPnO9GHt?=
 =?us-ascii?Q?NhvikcW5eu52ElVglGVI7kwDoHvX8DYALNxuDtLWgWOVHwvVQxcyztqszuu0?=
 =?us-ascii?Q?PyDjskCAZ3M7g55it4FCoKTItoLbFe2r4QB5v4+G5OLk7R7gK6uWrwYXhRkC?=
 =?us-ascii?Q?fTzhQHLnx7VL+I/em49KYJhfBUpcPpGA+kYHTtNeDmL3I5nWnn6DlWzHOEcA?=
 =?us-ascii?Q?enPldVLiN56h7J8s+70KnoITHcpyy9m6FSgpBX2lpbH9OTFKGpy/+nBG9cRX?=
 =?us-ascii?Q?lEFf2HVTYYLxHpxLoj/VCa3vQfOykEGQ6cYS3iv6KCPUTY1hdKkX3AIH4+7c?=
 =?us-ascii?Q?P66Ir0irwE3tmZlvecyajn+iaIPqgkLXzQpP0kpteMNpvMw4UA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9CFF14D219818B4385552F4FF82D437E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5647
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5cafe082-2838-4bd6-26c0-08dd6098bfcd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mGMHJXdKV0szQg3y6xD247IYSl/mOI3J0dRcJD05DMAJsIOJC+yl/twTrGNO?=
 =?us-ascii?Q?EBULR6jjPHqheUlLymuDMw6iz4DnMDspF+csuWlOB881iUXYnRVxl7KcOeaa?=
 =?us-ascii?Q?HuUINv6fDVLGA/f3vD2iWqguvMSVyaH7jAaST6J1YcbReT3JJm9ZVtI02y65?=
 =?us-ascii?Q?bhEuc+pZWVZsKtfx8CSgOrUljIRc8E4Pbgvimgu+kWHoXoN5m+AmgXSS18ju?=
 =?us-ascii?Q?SgVraFqtE/CuPE2K426Lc5/bnbZDXoMeJLVg+GHl6zvTNL8aGKYRxtYG30lX?=
 =?us-ascii?Q?RTQxTJ6hh50L0PiJqtAW7VBchsYY7EmUbNrKiuWX+e8wscHzw8T1eOIf01yR?=
 =?us-ascii?Q?n+jsEU4xiI0PnKZyLou5cdYTTTc8QaiFyP1dCAXfkScFpkDpmkCfV8AbzXeT?=
 =?us-ascii?Q?U895cKoK9y9zmFZEF/ooIkMKEkym8w2Myh+sCzJ5NJVzZfofj0/Fq3qZUSDM?=
 =?us-ascii?Q?lRbB8pFUkvsMvqCXcunJzECwbPkIJCzdciZfJaQ8MCuRdX2Oon0XAsnYKq/c?=
 =?us-ascii?Q?EuPT8ordJ7Iz8kgYcZy8ekXiBYziNNME9stYoxJpSY8coKcIpA6PJHLWx1ua?=
 =?us-ascii?Q?SZQkSyoNP6A56KXcilSDqGZV47lPiXXFs/Opf2QCjQzsAUaZpTxy5jTKSdLl?=
 =?us-ascii?Q?M3wWjG/rE6hq0htiPGHvUiY3F/kGdY9WUcdnBhtO93qAsKfIQs1lGNhWFV7t?=
 =?us-ascii?Q?dWXSLljWrPYN3EG8xshpaxMutTlHNjwEoivZBuPBeAu/S3pb1l4Ndqaw1FjS?=
 =?us-ascii?Q?T67+qbV7Hapt9E1LvP708q9Im4bRrC76B/EZHvRXTVHij1ROrBF3zwfNb7Zg?=
 =?us-ascii?Q?iy2IwDaB5Xa3Elb676TVjGAZG+mlzUfN09aNqV/+zc7uhSPeVdjta37S3iY0?=
 =?us-ascii?Q?8jwJvY/Mez5hIlvcqmfDZffzGuVecybnE0R2e4slj+B+2RDRWqalikLwboK0?=
 =?us-ascii?Q?II1xLiMostQCmzD+Jn5DgYgw/Rtq9N7Oc0PG4h+FycZDg/PNA54J/xjbnSHT?=
 =?us-ascii?Q?E/MueFzBH1+QPEADvAKKPzFOb9aXyEEVKBHFIoZqqAm8VUqkJXmBHR0f3VNT?=
 =?us-ascii?Q?MaCzwV1VfmrKdMYcEFJReOvvRuCBMCUbkdy3hWUmbTXWjdOi7/3VOAJH7G54?=
 =?us-ascii?Q?gbV/tRyhtlv31YLOATFtgZ9mRgzhVNNJ6V7UqpW+zqeUoeQg8FXY9gse9puV?=
 =?us-ascii?Q?OjbFhGzAfktvjK9kAqECgeNNtCqaT6dzXHdPyOvG12EKoTI9jqofybBYkVHW?=
 =?us-ascii?Q?vbyQJdXw03dbzWWqJ1z/WgRk0pZGDt83Fj4NlJmehz13vUZtxpNv8CSPBBNt?=
 =?us-ascii?Q?+MRWGtsRt55F2/YTfO7kmiEAsU62a8eUFAXqqFhotDEVQ/ueqiNjNPXZl124?=
 =?us-ascii?Q?7wsOxbSsGP3pIizeEUeHzrxWCGq5yoZK8jJswFzv1rXzlW2PydEMfQIb5kY/?=
 =?us-ascii?Q?tR/zL1QlGOvWNbB64vy2QD2izz1wLlj8?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:32:22.7550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ad8c0f-421c-417e-c4d3-08dd6098c5df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5916
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 12:32:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6532

Works for me, thanks Antonin!

Ross

> On 11 Mar 2025, at 10:56, Antonin Godard <antonin.godard@bootlin.com> wro=
te:
>
> Add an entry to the known issue as the NVD is not up-to-date, the
> impact on current CVE reports and future plans for the Yocto Project.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> documentation/migration-guides/release-notes-5.2.rst | 17 +++++++++++++++=
++
> 1 file changed, 17 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docum=
entation/migration-guides/release-notes-5.2.rst
> index 417b202cdbb16d1ae6b95d8737b36f76a58cf6ef..eb8011a2797b1d3cc58514ffc=
e01f0c8e7ab6f63 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
> Known Issues in |yocto-ver|
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> +-  The current :ref:`ref-classes-cve-check` class is based on the `Natio=
nal
> +   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are =
aware
> +   of, the NVD database has now been stalling for the past year and CVE =
entries
> +   are missing the necessary information (:wikipedia:`CPEs
> +   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check` =
to
> +   properly account for them. As a result, the current CVE reports may l=
ook good
> +   but the reality is that some vulnerabilities are just not accounted f=
or.
> +
> +   The Yocto Project team is working on a solution for the next release =
(October
> +   2025). This solution should be based on SPDX version 3, which is alre=
ady
> +   implemented in the Yocto Project with the :ref:`ref-classes-create-sp=
dx`
> +   class.
> +
> +   The `CVE Project <https://github.com/CVEProject>`__ has been working =
on
> +   catching up with the missing CPEs an so is a candidate for being a ne=
w input
> +   for enumerating and classifying CVEs.
> +
> Recipe License changes in |yocto-ver|
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> ---
> base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
> change-id: 20250311-nvd-stalled-ed957989e05a
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

