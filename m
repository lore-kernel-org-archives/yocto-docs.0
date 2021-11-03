Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC36DC433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 09:35:40 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.43])
 by mx.groups.io with SMTP id smtpd.web09.5149.1635932139376454672
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 02:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=HYLhND0s;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.43,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cao8v84gsGmGjbEy2HKwrWkNeWQynS7hZwd2whHCLZH6UPKGp4rG3/5mvf4DUaBN4gTF30yIO6zxWupkXEJ3GgnPAkfKQ+yIVN4zVNz3Zfog66WVh6VEAabAWZRlvXIazVI1wqCkruJwLUhJPmknaGvTdw44e7bqzSeOlXjxhW1gvJFYQxCQfrrAE+bmWPRfcF2hRU3fy7p83oZzDWbebZ0vpMEoNNACJe0rTwGbeTg6k+CgecPEr3RZ8BQsR7ugyk36KXl9fUc4FPHjNqRIoN7orO2CZv1/Qbqy8HCF8a8LeJFSYnzx7FNkg22PdhnlO0TfWkLESzOtRWfReRkSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNQ8GBcFmkcgCO/fHlVTVucaPlphcI2BIWxssCpMQko=;
 b=AGsLgD6D/CydEDuzhHTKSKEfvsceFRxLO1fNVvb9fQR7j+PuR7gBR7hIPiEXW+sQ2MGZJFPozLJo+mEuOOp4VYHueX1X7kCFr2sf3guSdRL6ldxUUpbQ4qNOAl/V4EmW95H7ax1t64pwafFt7QaJu1/u0toAjn/cjgyYs8uB7+3fZHgBMRwWP9bYy//Zgp2eipqij9qKsqT00J4ZHAOUVF2jR5t76hY7HDuuI/e/wTnjhCadNdm4lJjYdznEGF0iVMhkaoLGmnAwxwxS94BpJksKDgJqeYvq3+/eLhEltMzLHPIW1XorBK0MnJZzdz+tlJAFIm6VE1n83zivX1Uaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNQ8GBcFmkcgCO/fHlVTVucaPlphcI2BIWxssCpMQko=;
 b=HYLhND0so6J1aM2TXpWVq6OUAeAW2wjL6447sO8nBexrqwwBv1iqnj+NPXStvAmUpVWWDGiKrh2BLL0YmEVLobn4tD3vsNze3zkbMInbLzkyubPzqJ4PXaYm6OB59jF/Hp/Uwmi7mJi7hk7EcsEU7awBgMjwQQsUM03UsLZ1NfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB7587.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 09:35:35 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 09:35:35 +0000
Date: Wed, 3 Nov 2021 10:35:33 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Variable documentation overlap between Yocto and Bitbake
Message-ID: <20211103093533.prsusa5rblbmqset@fedora>
References: <f9c8e642-a6d1-afbe-247c-39ac1db60a0c@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f9c8e642-a6d1-afbe-247c-39ac1db60a0c@bootlin.com>
X-ClientProxiedBy: AM5PR0502CA0020.eurprd05.prod.outlook.com
 (2603:10a6:203:91::30) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR0502CA0020.eurprd05.prod.outlook.com (2603:10a6:203:91::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 09:35:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3bf2072-41a0-4af2-061f-08d99ead49cf
X-MS-TrafficTypeDiagnostic: AM9PR04MB7587:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB758723FFAE20BB99D16F323EC28C9@AM9PR04MB7587.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OpmwBcOilB15a1mr8FJDiF+XUUK491VN/65Tjw3mecJkWsahi9Lo+qXQQ43J+zCCjyw8AJYZNnqly0e+3HtvzrLma413WJWLPAa0yRHbkX5liiONi+k4YoQN+BwF1ps4rVoag4x2u/JKqr5+n/jjYk0oyXaq3qcN4wqH2pP0OP7nOcYXu8zDHt/cpjW7GC9IRKCSV4TT6X8PWs1RJDHjQpXocu3IAL/gIEB6ZAIcRSpggUHwwC6oBJkfWvn/2FBrzy4SCM7UQZ4V+7b8vWUybwaOg4JDpU0SAAtUmRrlsJ6crKoyPY5hHauQywjZ4x6DDewJJUH1pX0wf4H5rv6OuWIF5sSAoO9oLMJO+5belFFtjeGw7tHdTsMi87l9c3cJGuf70RrLyFVRR+oC/zPKEnvYBqzMQsiv8UJJELWgpH34XVJTbVS5VyddOQ5cuuZVu4QTi2wmdBFHbVcabwVavHwRirADvZK0W0Pc9vvsogQrcdIqv4BqJY8SxCGPb1scgEPJHBc6tDq6tj8NUpYQiooSuRnS9YuDWsQ0MSjdST+49zw/v0xJXXAbMwd/KN+8w1d+YICbdq9RKlrzXdd8SZz46jB9EplDi73+7hjFJMCmZDK1fJjkoSxb6PCRDU+JrcV7qxwqts292MmjuAJIOdvNce00Pv9jNdzCHRCbXW/Lrm2/E2NpQjGBVNkCF661w+756q0wq+mh1LG8SjaAqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6496006)(316002)(33716001)(66946007)(55016002)(9686003)(1076003)(38100700002)(9576002)(44832011)(52116002)(2906002)(66556008)(66476007)(86362001)(956004)(8936002)(508600001)(186003)(5660300002)(38350700002)(8676002)(4326008)(6916009)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jKrJieVUhzKc2w8GQrDo0e2GdGGIyzia/CYEHqeGRBiVNurD6GmA41SXZN4J?=
 =?us-ascii?Q?NJTLQjYWWAktbww7tLAqvufKL0ni10Bddt+jLePmamiKPP3PARje4bJlnAM7?=
 =?us-ascii?Q?/NkNTlToYsosOYC+eXHZ/R2p57/Adf6A45vusYmRYxPgbdU0gFFKiMHO/zRN?=
 =?us-ascii?Q?G04WybSFa7HFD7FTMLl9ZmdzReh/NiRPr+YrSq/ntCpDeIDNLQ7NsItWZ+JY?=
 =?us-ascii?Q?TK3noviCnSwzXnmpHF8QAES0s8/gXdrawC5i05Y6iLaB4dMSfIjaQAIxMbwB?=
 =?us-ascii?Q?xX6O5i+/YixSA8HhE3IJG/fJ60gmGhSx0LWHMpEB2wEcnvo3yiUC7W5UfcZN?=
 =?us-ascii?Q?D0kGcCwP8l7fPM2EcijjOqcua41FtaQF6pvNcHfSOHmu1oWQeqyVaIHSWxfc?=
 =?us-ascii?Q?PrY7VHkJBHJTZ6Q7M69XoGaTnFcAtI23mfmUwI7HZXIOrkmguIE7tUXnbC7f?=
 =?us-ascii?Q?0+Qo3REqLxlXQJyzz2grxBFtqYgO9VGiPI6+Y/oX/gHhAjgssr0Gk+dVRkz6?=
 =?us-ascii?Q?MmVUEMZCqahne6G0//ByG+x1c8I9rHCUk7xkXYnA7X31qYKwCB/+woeDOqTY?=
 =?us-ascii?Q?IRUx+6qt5HmKJqFqlx9oeHOGkYDUQRFl9+ihHd4yWzxOTecncAHjLsYSc+rl?=
 =?us-ascii?Q?3eB0674Y7wUD3u5UjI3o+LmK18uMhZt7iSQA51Ccz4tWQXFcAZQ60vDxG8N3?=
 =?us-ascii?Q?Sn/RQ1JCwlzJl6wFRLY1YucU8uRIMn2XPyku+wY93Olo4LfFNt16NlDeZyzY?=
 =?us-ascii?Q?iEPJKfDC3V9al3ymycnV7kzXwxx1TpHg+DU9JZmuh3O5hc1OuHJ9GzjXGMlS?=
 =?us-ascii?Q?NdTcvx0O9RsB71mIQDydRihPIpT0IfdITrJ612ir6zn42jfGUN5LI7R5UzEi?=
 =?us-ascii?Q?pbyk6gvZdoa3DHQgoP2CAaO61enS/pQZu2ANUQegAdUIep5ZkguD28uY6tJ6?=
 =?us-ascii?Q?e+dfy4JPoSviMQ4GNHFiv1X3u1MP9SE0Tvi0qqVoAfcCWW1eu/dqAar1aQE1?=
 =?us-ascii?Q?HGFiC/kT01Bt/2RiMjfoI3uPybQG+XL3bR0N07rZlhm/nMFwCdDCEZcBS/Te?=
 =?us-ascii?Q?euQfpv1q0ZICHX98vS/Ztl0tZpjiuwf99J55gMWQHoQ7LvpnugRlJfrB0PFo?=
 =?us-ascii?Q?idf+QaI2HF0I5Pt1SzptFJ0/joZ4IagMBgDbiQz0oxu2+TUD++SwhrlQscD2?=
 =?us-ascii?Q?vnqMPpxKPKMRI4xqKvZkWaBNlO6G40LJaeEAWhOf4OZKBLuMGXe3Pizpn1X0?=
 =?us-ascii?Q?yFzqxiB/TM7vfe0wJXYiSUUuDkq1LvoZgTg1t3xjjfVBgYXsgIiC/Cv/hMzS?=
 =?us-ascii?Q?J3hmn3T7UHsLJ+ALRJv0CRCrlWtgdlab6UvQy7VXf+ujQDVTKM+uqSzY496+?=
 =?us-ascii?Q?mQoPK9o7+GDThnWleJ8ij9ThH/NPGy8DurAqgJ4MZp8Yy9MdI9Pu3YZxxuqF?=
 =?us-ascii?Q?YAaRwglEruP7Dv/AywnJOSf1Jn7wAyT9X37i901IzMTyQfparJMV/eUR52a/?=
 =?us-ascii?Q?bkwyVyPNa/pdPZWW0nJWG2rlUwP3eklXgw9xmws52kHXy5cYE++cynJmw/B0?=
 =?us-ascii?Q?0Ylj2E7AiQGhzUYlu3r/Z+TQTvERkVokmuvH+IxKBf/vwa3JPWP9StdpIu0b?=
 =?us-ascii?Q?BIG5t2J9NG2o2KQ+VeghlPakqAxKLWSuETGj0oGhQN/NyNqWM3g7Jz44UZ70?=
 =?us-ascii?Q?s9BhWQUtG1Tt/DcmHxdaAdtO5GF5g5/zFTSE3/Bs2WR4BZGgrkj4LIPUrX1T?=
 =?us-ascii?Q?Cs75XoIoig=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3bf2072-41a0-4af2-061f-08d99ead49cf
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 09:35:35.6989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FdyxQclrfVW2Ke+p+KYXS6jgDqZmWPUJSmyFArv1feCNquO3Vh+EhyeyCvWjK8w8pz1CSk9E0jeQO0Uc9aFEP9oyz9irLzKhHCf3dHrabEtQ2dcFqOS3bOp2paKcqY32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7587
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Nov 2021 09:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2073

Hi Michael,

On Tue, Nov 02, 2021 at 08:06:21PM +0100, Michael Opdenacker wrote:
> Greetings,
>=20
> Following recent discussions, I realize that the "gitsm" fetcher (Git
> Submodule) is not documented yet in the description of SRC_URI.
>=20
> However, shall I add this to both Yocto Project and Bitbake
> documentation, which both describe SRC_URI? There's a lot of overlap
> between the two, by the way, and this makes me uncomfortable.
>=20
> Could there be a clean way to document all the common stuff in Bitbake's
> documentation, and only OE core's specific options in Yocto docs? I'm
> thinking about options such as "striplevel" that are implemented only in
> OE core...
>=20

What I'd like to see personally is removal of duplicates and have
entries in the glossary for terms defined in the bitbake docs. Since the
objects.inv from bitbake docs only does a mapping between references and
URL... I guess we can only add URLs to YP docs variables glossary.

For how to include common stuff, I guess we could give a link saying:
Common stuff defined in Bitbake <link>

Here are Yp/OE specific stuff for this thing:
<specific stuff>

I haven't really looked deeply into Sphinx so maybe there's something
possible but out of the blue, I'd just say we have links to refs to
other sphinx docs but nothing else.

Just my 2=A2, not really offering solutions :/

Quentin


