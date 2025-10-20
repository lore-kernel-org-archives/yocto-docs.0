Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E140CCD1A2
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 21:15:04 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.43])
 by mx.groups.io with SMTP id smtpd.web10.3685.1760994900557043395
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 14:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iP68Vr1w;
 spf=pass (domain: siemens.com, ip: 40.107.130.43, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fs7ws5NrEjBAuwhQd1ULayFcqHyLADcuyWw9Og7xaLcTMhCIcy4tmDKZL3oG7WT6GBYeAOsxbrn1+7kNcCkrOVtOV5kNs0uvzC/2RUT7reROuznV41nV+s5TboHxVJCEStTdT0HgNpVLbO4j6xhBsHrJDmCykzpAPQ6S7m9iPaAa0mESLvLAOGwdsJQ/DgEdY6m5JJOf4IkS9o/p9efzfsM5UpHsf/snIUfEAf3ZZvopAGtHfm+DqqkGa0KtOWaTaPciI4JM6xp49R7sx0w0wsLiIc7Aqq3KaWqODNqnpP3XcMESbTv0/1Y5GMOlBsXy+GKfPEoGpsvVYGgBIZfYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVR9cmunGofbKnYMjYCiKmFckrxtogNGKHZSnKrp+DI=;
 b=NNzOnvmsaoHAGGiw2/3qFJ07mZRq5qPSsDhjgO60CXqvZMdvmYuqIzY0cXYOOQaOE5Rhs/IkLBlyZx6ym9ZCIm+mo6LZsuakJnfVZsB2kFYht+I7QwegW2uf+W7Ueu2WW7+cnJke8OAK5o5rFuszdVwqrorDe+A6g6SxgqHVG8dv2isX/1OW/wzEOpma1cglsXB76Fvlg6GRfAB5lDpeEiHGsYwfkyfpI9zBu9uuxd550YlU97/nm3lR7VUm++/4PpsoRVSrft6+a/Q92emGjo98gfZb4ajH+FfYdqu3olwaaZFBNVd1ml4NTy6+AEceqQdqdXS41XNHWp4kWs6bZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVR9cmunGofbKnYMjYCiKmFckrxtogNGKHZSnKrp+DI=;
 b=iP68Vr1w0euLDEh4UBjH2rD8bIwQBfGFwddXEAsifb+6UATulncNQs1NCqi2djL51i833CmgE1Kjd38fUxX3fca95YOhwb2Z0jUGP/NcxN5cyBi7CEXNYseRLaERfhiX/A69imcrZDm5ZIWRou9Lj8sDO6/oEBDuISUz0mdV0AFJ/PZhUbGdKbGjJooKWq4olJCF5dIqfm7SowATOpCq5Noo1jLeXlSj/kaI9d9nWIV/yDTOYA3iTIuXBsCFZTaPmQ+iyX8rqtGWBg7LTKnjcSnt1unyMiveNEV1oLfQh3ieRc6Kwf8BiF8qkHE20cIUSZpbjeC2mV0+fCdBH8TTxw==
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21)
 by DU0PR10MB7947.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 21:14:56 +0000
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213]) by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:14:56 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: "kavinaya@qti.qualcomm.com" <kavinaya@qti.qualcomm.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: cover FIT_LINUX_BIN
 variable
Thread-Topic: [docs] [PATCH] ref-manual/variables.rst: cover FIT_LINUX_BIN
 variable
Thread-Index: AQHcQRgdVVaV0/dHk0ijpB0wE+jHZrTKmLsAgADwiyc=
Date: Mon, 20 Oct 2025 21:14:56 +0000
Message-ID: 
 <VI1PR10MB35359630A67B9F6996D495CF8EF5A@VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM>
References: <20251019164740.3795019-1-adrian.freihofer@siemens.com>
 <DDMY5GUGNQIG.2PSN7OVYSED7K@bootlin.com>
In-Reply-To: <DDMY5GUGNQIG.2PSN7OVYSED7K@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-20T21:14:55.558Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3535:EE_|DU0PR10MB7947:EE_
x-ms-office365-filtering-correlation-id: 13ee9281-2849-42e7-e08d-08de101db85a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|31052699007|39142699007|1800799024|366016|38070700021|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?xxSYPI218ft1n2AcEBSqJ0j19/yCbfjTSN2F4c2sC5tTvm7zoCaTvbI/h0mg?=
 =?us-ascii?Q?nS5YCVOMZMHnOaDSLS7ahGyHZLlr0i1Vk2o0GL8ZzsClPFtWiMZUVD9tQjEV?=
 =?us-ascii?Q?rwiHCDCxtG4beWDptx8FagLBJ7n4PTE9ymOibdQirQCO3k7BiHOMwgNofQGX?=
 =?us-ascii?Q?YddjnXQTqmHGAB5tAQcGaYjstgrWEcPYwltL33HuPew9gKu/pEF1lP9NkQiF?=
 =?us-ascii?Q?JCKrHJVZt8rmZu37i/sdFzIv/avDkrrgLORfAHqFIeL4WdV6dEuT0HtIK8nY?=
 =?us-ascii?Q?43Rm/qAQ5MB16pBrdqu6V1khqPP17wGFNr9NimkmKnVfDhnyzMOXq8t7dZBB?=
 =?us-ascii?Q?HLkGAXPlUu5SCOJT8+WXKtBsX1e0qyGooHO+cOVq1q042umzi3LBfevHPhIc?=
 =?us-ascii?Q?t2xBrekEyvegklz7vLRFXWphitDjRsUbS0Xv/sjJ+3lq4YDTsA6Ll/2mIuJA?=
 =?us-ascii?Q?kMjfaAqKozmCyWUss1Xddwg5r4CYea6QKmm7XOiJLXxMf/ZRnNX8Pb0YnJjP?=
 =?us-ascii?Q?xBO0PPTwMtD7OWyW0wDAZQgavokre2K00M/ZDiRE6NMpUYBnvwfzSu+lz4sP?=
 =?us-ascii?Q?i51Y2d987URTMWAt+PocqjY7oK88C3WbbBCW8Df8V/zK4W5xYq0Z0P6CoBPV?=
 =?us-ascii?Q?uL6/wPHFKAHirGKmoKXfNxi+EqaLq5WqtotlUTC/Nh1naHJ8rAvFZ6MBmAlC?=
 =?us-ascii?Q?EemAU9zcYOvIbcyR4kcI4Wk6KIwGUt1K/9R5+7QsYyJi/OJ44Pc+QY0sfjR1?=
 =?us-ascii?Q?d5zXtlDUE6C7hWYG4QPY1HLuqaPx4bP6ytbJLJFKWUGUNSukJVSyuVu2SX0V?=
 =?us-ascii?Q?j1s8fPlXRJoBLQ+rlJAia5oy/zsDiXEbW07kVqtmjnVGoqFFIwuaE2r9ntTr?=
 =?us-ascii?Q?N+7D/U8EFyhFAOFfQFDy0jeLIGzle8F+A8Bk1hYKJl9agjmuQMuI03JRfQ84?=
 =?us-ascii?Q?MXo6B3Zkt2uLgHQWVPiAZuqQQggAm16QCwDdePUVuvMnGYHqShFAkCBvwYlC?=
 =?us-ascii?Q?5sm5yDoQg87dZhFm0wDIWHcyRSyeG7gBFL3zncoBvAbzyjWKxq3n/Caw0chz?=
 =?us-ascii?Q?/0LEuUxYgZs+PAxFkmlvSHBbwyuH+A1DWVdTpvBQ12YBG/ZUp21HKhPPUNAt?=
 =?us-ascii?Q?JBEMzrQT3nlyqbBiQhNPvLkocDZHzwRf2MwXq5BCywYaJv/N91pT/iQeCFD+?=
 =?us-ascii?Q?/HADt6lbDBqMZO7NmXbdG3BOcGETaMYBHepiAJRlxta60d1V12qAItfCByh0?=
 =?us-ascii?Q?UI2CXI5QD+qorVqsf/btK6pY3SiFbQ5FPIFE2maebpOubDrShLOc2YUiOKpF?=
 =?us-ascii?Q?ja+KP5wyym+zoYl8DRCfbw2W3uExDBhkVuXGzrKDI1c4l86if63CcRNz5tXZ?=
 =?us-ascii?Q?FVCBtQI4nNPAH60B5qsySad9Jx5YCpM7ZwhreVFjC+uQSb+2sBA/o8LixLO3?=
 =?us-ascii?Q?cDi5dmBNNJEM1ZBvrOzuYZOzFLryyXii4Amn1l5nwNuYBxyyVd0CMA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(31052699007)(39142699007)(1800799024)(366016)(38070700021)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QOrcXW5jPIjNrMigoHwyY5o2I0FbkZU/l5tg4TJq5Ji82Nd41Soh2SUatINY?=
 =?us-ascii?Q?jdq7Nji7ASgMAT9aQeO6dmwQbldn4wlINlLrLuZqeBnsIQiT5JtR7IF688ZD?=
 =?us-ascii?Q?YR4650umEheIg99pH15oAmxgRqMIYw6t6Ofc1mipIs9iMnPgkud82gG5TMsF?=
 =?us-ascii?Q?FuyCivEqp3FWL16nbVxQXqxrlqg0tmlq9ndFumN4YOku0+soD2+a8/+tZV5S?=
 =?us-ascii?Q?lKJYbP5td+mKO5WHAg9oMJNfpwnP+TjsNhr4YhUE3mycWx63S2ItgjlJbcgN?=
 =?us-ascii?Q?+MEWPO6w9EDpPl2TbBMCy/xteksWpnh+DDgSPXJVItIqkooEOnCAbZtdE5gd?=
 =?us-ascii?Q?4+szfL8amIfGl+ZsTKlnLRry0+wOT00eXpBhX0uAWPULuRb4Eka+0PwX1+ji?=
 =?us-ascii?Q?d2r/XyZ5CblnBSfd/251scH984jRhzY46Dfmy7q72RQcCRvx6BXwxoMh1sTW?=
 =?us-ascii?Q?uScWNXg4FHoqlt2xmbVOUL8FnsiXsR8uIh28HrlIsTcafFL4UeDID1pYR/B2?=
 =?us-ascii?Q?I3Ct8KNISbV0BoXS0UwWuLnW0eRSQdHJWZkKVa0A3+UL+SrZrBhD7EszhdYF?=
 =?us-ascii?Q?9OjAwDmc3iSuAn9ieGnugsVZaceKJ9wH2r5oQEeUDfzQYWWhqTw50UB5kP7N?=
 =?us-ascii?Q?xPTNC2vz9bnDW13znBIu8A9kB1DGlmXqwRVWDdSVPKBhDesbxtavwL6Au6xJ?=
 =?us-ascii?Q?Sm2aw6swCdTLXSYG5IysUku56q6UERwTGsei13R19h5eJRgYz/4DlK8tVcp6?=
 =?us-ascii?Q?IIKB142Hb6OqmkvNzzjA2QX0LEl/gT3E8pepK8Ybp+XU5bGlSLeD10kC/klH?=
 =?us-ascii?Q?snFImnt8NB9CPn8PNzs7z21uOxGydHnuX4uKFWUZzdaAyt5pWyqbMC+GSeTx?=
 =?us-ascii?Q?gbET2fo1ySYFzmKWZkvzyqeQMlw0CJhUa5oAFavmBqHRXOe5DDnlzFoaiWTc?=
 =?us-ascii?Q?MKQAJKwPiNO0d3f2TWuuycepYbAgpKAouNUF60DuE/0XcGGv3QM8Fug6TccD?=
 =?us-ascii?Q?71YYWiT4j4tZTW5y7wO37QDGJWOdfOh5EZyvAqZ10Ti1ZJ0BL9Be+EHCNZ7w?=
 =?us-ascii?Q?vWPO0mZF95faOUlb0RUyEFZ6iPrBEfYP2z0CBEMcO/sNp1dJma+tjcQ/GrBA?=
 =?us-ascii?Q?yAcNYmN0lQa2Bq3IOKqx91BYAnsi0hpdiWef8yG0FC7rqqCg1yOfSCqaQaYh?=
 =?us-ascii?Q?6thjxQWbHDqbVR06Ffe1dW8B65Clq8ZoIhwh3ahjoHRRoC5KEIOZ73VP9ZLk?=
 =?us-ascii?Q?EKa91nDxknsWwGEMgJPFkFLQlMKlzUlPZlqXeAWcXfJNaw7vVik2YqCMFWvT?=
 =?us-ascii?Q?f3zJkBa9Sq2vY6cGOuR1QHoM/L8r84tmdKOE39W3QR81K5SWCkXEcAmTD07R?=
 =?us-ascii?Q?Kzoq/82Cq5OBAjOMjBtY3aRN1BdwIv7GUoMHNZ8o5s+ThVHbwmAqIpn6X4Cw?=
 =?us-ascii?Q?zPB0oqLFgZ1O4s/MXTVr41eOadA46cfl5LNeX4afF/6v7qzdV66oXVcW0MVm?=
 =?us-ascii?Q?vuRM3Ne2NpX6qHPNpohjEsC4gnAhu1L93qRGJ3hl6/JwdFkw7mB1Y3DfoSmW?=
 =?us-ascii?Q?AEDkF0vr3PK92ttTu5acR+Rk3PPAN2zF3wevp9xR1H3gaImDHE5cn5xDs+TL?=
 =?us-ascii?Q?oA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR10MB35359630A67B9F6996D495CF8EF5AVI1PR10MB3535EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ee9281-2849-42e7-e08d-08de101db85a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 21:14:56.5723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FSkeCu3lTjmLHlQjiCEOFriL744mvQDTiBgkx0N650wZxHaU6VSR3kUpT6en29qro6lnP8nhUFBPX3O+BBZHx2aEQwnaZ+vQvYyWEBHp8Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7947
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 21:15:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7762

--_000_VI1PR10MB35359630A67B9F6996D495CF8EF5AVI1PR10MB3535EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Sorry for not checking the queued patches before sending my patch.

Indeed, Quentin's comment is valid. FIT_LINUX_BIN refers to a file. I am co=
nfident that my patch is correct. Therefore, you are welcome to either take=
 my patch or simply apply that single-word correction to your own. Both opt=
ions are appreciated. Thank you.

Regards,
Adrian
________________________________
From: Antonin Godard <antonin.godard@bootlin.com>
Sent: Monday, October 20, 2025 08:47
To: Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com>;=
 docs@lists.yoctoproject.org <docs@lists.yoctoproject.org>
Cc: kavinaya@qti.qualcomm.com <kavinaya@qti.qualcomm.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: cover FIT_LINUX_BIN v=
ariable

Hi,

On Sun Oct 19, 2025 at 6:47 PM CEST, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Document the FIT_LINUX_BIN variable used in the fit-image class to specif=
y
> the kernel binary name included in the FIT image.

Thanks for the patch. I also sent a patch for this last week:
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fyocto-docs%2F20251016-release-note-5-3-second-hunk-v1-14-20f21db=
1f93c%40bootlin.com%2F&data=3D05%7C02%7Cadrian.freihofer%40siemens.com%7C0a=
d15534d3614def82cb08de0fa4a2bf%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7=
C638965396937776315%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI=
wLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&=
sdata=3DF8KN667flkk3CMCj0u%2Fv5zZOOO13E02pwB7csZ5UIEc%3D&reserved=3D0<https=
://lore.kernel.org/yocto-docs/20251016-release-note-5-3-second-hunk-v1-14-2=
0f21db1f93c@bootlin.com/>

Quentin had interesting comments on it, and I think your patch more or less
matches mine, so the comments still apply. Can you have a look?

Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C02%7Cadrian.freihofer%40siemens.com%7C0ad15534d3614def8=
2cb08de0fa4a2bf%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63896539693780=
2952%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl=
AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DMsnMf7O=
sDmqPIuh8Lc7C2zlz6gDvGyV43Yu6Xn9K7qM%3D&reserved=3D0<https://bootlin.com/>


--_000_VI1PR10MB35359630A67B9F6996D495CF8EF5AVI1PR10MB3535EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Antonin,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry for not checking the queued patches before sending my patch.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Indeed, Quentin's comment is valid. <code>FIT_LINUX_BIN</code>&nbsp;refers =
to a file. I am confident that my patch is correct. Therefore, you are welc=
ome to either take my patch or simply apply that single-word correction to =
your own. Both options are appreciated.
 Thank you.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Adrian</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Antonin Godard &lt;an=
tonin.godard@bootlin.com&gt;<br>
<b>Sent:</b> Monday, October 20, 2025 08:47<br>
<b>To:</b> Freihofer, Adrian (SI B PRO TI EAC CCP) &lt;adrian.freihofer@sie=
mens.com&gt;; docs@lists.yoctoproject.org &lt;docs@lists.yoctoproject.org&g=
t;<br>
<b>Cc:</b> kavinaya@qti.qualcomm.com &lt;kavinaya@qti.qualcomm.com&gt;<br>
<b>Subject:</b> Re: [docs] [PATCH] ref-manual/variables.rst: cover FIT_LINU=
X_BIN variable</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
On Sun Oct 19, 2025 at 6:47 PM CEST, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:<br>
&gt; From: Adrian Freihofer &lt;adrian.freihofer@siemens.com&gt;<br>
&gt;<br>
&gt; Document the FIT_LINUX_BIN variable used in the fit-image class to spe=
cify<br>
&gt; the kernel binary name included in the FIT image.<br>
<br>
Thanks for the patch. I also sent a patch for this last week:<br>
<a href=3D"https://lore.kernel.org/yocto-docs/20251016-release-note-5-3-sec=
ond-hunk-v1-14-20f21db1f93c@bootlin.com/">https://eur01.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fyocto-docs%2F20251016-=
release-note-5-3-second-hunk-v1-14-20f21db1f93c%40bootlin.com%2F&amp;data=
=3D05%7C02%7Cadrian.freihofer%40siemens.com%7C0ad15534d3614def82cb08de0fa4a=
2bf%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638965396937776315%7CUnkno=
wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMi=
IsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DF8KN667flkk3CMC=
j0u%2Fv5zZOOO13E02pwB7csZ5UIEc%3D&amp;reserved=3D0</a><br>
<br>
Quentin had interesting comments on it, and I think your patch more or less=
<br>
matches mine, so the comments still apply. Can you have a look?<br>
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C02%7Cadrian.freiho=
fer%40siemens.com%7C0ad15534d3614def82cb08de0fa4a2bf%7C38ae3bcd95794fd4adda=
b42e1495d55a%7C1%7C0%7C638965396937802952%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e=
U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy=
fQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DMsnMf7OsDmqPIuh8Lc7C2zlz6gDvGyV43Yu6Xn9K7=
qM%3D&amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR10MB35359630A67B9F6996D495CF8EF5AVI1PR10MB3535EURP_--

